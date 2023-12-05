import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';

class NewDeviceForm extends ConsumerStatefulWidget {
  const NewDeviceForm({
    super.key,
    required this.onDeviceCreated,
    this.showLabel = false,
  });

  final Function() onDeviceCreated;
  final bool showLabel;

  @override
  ConsumerState<NewDeviceForm> createState() => _NewDeviceFormState();
}

class _NewDeviceFormState extends ConsumerState<NewDeviceForm> {
  late DevicesProvider _devicesNotifier;
  final _formKey = GlobalKey<FormState>();

  bool _isLabelShown = false;

  String _uasId = '';
  String _label = '';

  @override
  void initState() {
    super.initState();
    _isLabelShown = widget.showLabel;
    _devicesNotifier = ref.read(devicesProvider.notifier);
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    _devicesNotifier.addDevice(
      Device(uasId: _uasId, label: _label.isEmpty ? null : _label),
    );

    // Submit successful
    widget.onDeviceCreated();
  }

  bool _isUasIdValid(String uasId) {
    // Only alphanumeric characters allowed
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(uasId)) {
      return false;
    }

    final serialLength = int.parse(uasId.substring(4, 5), radix: 16);
    final serialNumber = uasId.substring(5);

    // Check serial number length
    if (serialNumber.length != serialLength) {
      return false;
    }

    return true;
  }

  bool _doesDeviceExist(String device) {
    // Prevents duplicity
    for (Device existingDevice in ref.read(devicesProvider)) {
      if (device == existingDevice.uasId || device == existingDevice.label) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLength: 20,
            textAlign: TextAlign.center,
            validator: (value) {
              if (value == null || !_isUasIdValid(value)) {
                return 'Please enter a valid UAS ID';
              } else if (_doesDeviceExist(value)) {
                return 'Device with this UAS ID is already registered';
              }
              return null;
            },
            onSaved: (newValue) => _uasId = newValue ?? '',
            decoration: const InputDecoration(
              labelText: 'UAS ID',
            ),
          ),
          if (!_isLabelShown)
            TextButton(
              onPressed: () => setState(() => _isLabelShown = true),
              child: const Text('Add device label'),
            ),
          if (_isLabelShown)
            TextFormField(
              maxLength: 20,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value == null) {
                  return null;
                } else if (_doesDeviceExist(value)) {
                  return 'Device with this label already exist';
                }
                return null;
              },
              onSaved: (newValue) => _label = newValue ?? '',
              decoration: const InputDecoration(
                labelText: 'Label',
              ),
            ),
          if (!isLandscape) const SizedBox(height: 24),
          CustomElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
