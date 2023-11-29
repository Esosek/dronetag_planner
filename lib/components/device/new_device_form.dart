import 'package:dronetag_planner/screens/flight_screen.dart';
import 'package:flutter/material.dart';

class NewDeviceForm extends StatefulWidget {
  const NewDeviceForm({super.key});

  @override
  State<NewDeviceForm> createState() => _NewDeviceFormState();
}

class _NewDeviceFormState extends State<NewDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isLabelShown = false;

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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              minimumSize: const Size(90, 40),
            ),
            onPressed: _onSubmit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
