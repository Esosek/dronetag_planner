import 'package:flutter/material.dart';

import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/components/ui/custom_text_field.dart';
import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_number_picker.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({super.key});

  @override
  State<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final log = CustomLogger('FlightForm');
  final _formKey = GlobalKey();

  int _radius = 50;
  int _minAltitude = 0;
  int _maxAltitude = 50;

  void _openDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    log.trace('User picked date $pickedDate');
  }

  void _openTimePicker({required bool isStartDate}) async {
    final now = TimeOfDay.now();
    final pickedTime = await showTimePicker(context: context, initialTime: now);
    log.trace('User picked time $pickedTime');
  }

  void _setMinAltitude(int newMinAltitude) {
    setState(() {
      _minAltitude = newMinAltitude;
      if (newMinAltitude > _maxAltitude) {
        _maxAltitude = newMinAltitude + 50;
      }
    });
  }

  void _setMaxAltitude(int newMaxAltitude) {
    setState(() {
      _maxAltitude = newMaxAltitude;
      if (newMaxAltitude < _minAltitude) {
        _minAltitude = newMaxAltitude - 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlightFormField(
            label: 'Date',
            content: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: _openDatePicker,
                  child: const Text('30.11.2023'),
                ),
              ],
            ),
          ),
          FlightFormField(
            label: 'Time',
            content: Row(
              children: [
                Icon(
                  Icons.schedule,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => _openTimePicker(isStartDate: true),
                  child: const Text(
                    '16:47',
                  ),
                ),
                const Text(
                  ' - ',
                ),
                OutlinedButton(
                  onPressed: () => _openTimePicker(isStartDate: false),
                  child: const Text(
                    '17:47',
                  ),
                ),
              ],
            ),
          ),
          FlightFormField(
            label: 'Origin',
            content: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                const CustomTextField(
                  hintText: 'Latitude',
                ),
                const Text(' , '),
                const CustomTextField(
                  hintText: 'Longitude',
                ),
              ],
            ),
          ),
          FlightFormField(
            label: 'Radius',
            content: Row(
              children: [
                Icon(
                  Icons.adjust,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      enableDrag: false,
                      context: context,
                      builder: (context) => CustomNumberPicker(
                        minValue: 10,
                        maxValue: 5000,
                        step: 10,
                        initialValue: _radius,
                        onSaved: (selectedRadius) =>
                            setState(() => _radius = selectedRadius),
                      ),
                    );
                  },
                  child: Text(_radius.toString()),
                ),
                const SizedBox(width: 4),
                const Text('meters'),
              ],
            ),
          ),
          FlightFormField(
            label: 'Altitude',
            content: Row(
              children: [
                Icon(
                  Icons.height,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => showBottomSheet(
                    context: context,
                    enableDrag: false,
                    builder: (context) => CustomNumberPicker(
                      minValue: 0,
                      maxValue: 1000,
                      step: 10,
                      initialValue: _minAltitude,
                      onSaved: _setMinAltitude,
                    ),
                  ),
                  child: Text(_minAltitude.toString()),
                ),
                const Text(' - '),
                OutlinedButton(
                  onPressed: () => showBottomSheet(
                    context: context,
                    enableDrag: false,
                    builder: (context) => CustomNumberPicker(
                      minValue: 0,
                      maxValue: 1000,
                      step: 10,
                      initialValue: _maxAltitude,
                      onSaved: _setMaxAltitude,
                    ),
                  ),
                  child: Text(_maxAltitude.toString()),
                ),
                const SizedBox(width: 4),
                const Text('meters'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // TODO: Submit and validate FlightForm
          CustomElevatedButton(label: 'Submit', onPressed: () {}),
        ],
      ),
    );
  }
}
