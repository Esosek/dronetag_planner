import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/screens/flight_screen.dart';

class NewDeviceForm extends StatefulWidget {
  const NewDeviceForm({
    super.key,
    this.showLabel = false,
  });

  final bool showLabel;

  @override
  State<NewDeviceForm> createState() => _NewDeviceFormState();
}

class _NewDeviceFormState extends State<NewDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isLabelShown = false;

  @override
  void initState() {
    super.initState();
    _isLabelShown = widget.showLabel;
  }

  void _onSubmit() {
    //TODO: Implement NewDeviceForm onSubmit
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const FlightScreen(),
    ));
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
              return value;
            },
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
              decoration: const InputDecoration(
                labelText: 'Label',
              ),
            ),
          if (!isLandscape) const SizedBox(height: 24),
          CustomElevatedButton(label: 'Submit', onPressed: _onSubmit),
        ],
      ),
    );
  }
}
