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
    // TODO: Implement NewDeviceForm onSubmit
    // TODO: Validate new device

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    _devicesNotifier.addDevice(Device(uasId: _uasId, label: _label));
    // Submit successful
    widget.onDeviceCreated();
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
              // TODO: Implement UAS ID form validation
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
                // TODO: Implement device label form validation
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
