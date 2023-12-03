import 'package:dronetag_planner/components/flight/form_inputs/radius_input.dart';
import 'package:flutter/material.dart';

import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_number_picker.dart';
import 'package:dronetag_planner/components/flight/form_inputs/date_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/time_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/origin_input.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({super.key});

  @override
  State<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final log = CustomLogger('FlightForm');
  final _formKey = GlobalKey();

  DateTime _date = DateTime.now();
  TimeOfDay _timeStart = TimeOfDay.now();
  TimeOfDay _timeEnd =
      TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);
  late int _originLatitude;
  late int _originLongiude;
  int _radius = 50;
  int _minAltitude = 0;
  int _maxAltitude = 50;

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

  void _onSubmit() async {
    if (!_isFormValid()) {
      return;
    }
    // TODO: Implement FlightForm onSubmit
  }

  bool _isFormValid() {
    // TODO: Add flight form validation
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateInput(
            value: _date,
            context: context,
            onDatePicked: (date) {
              log.trace('User picked date $date');
              setState(() => _date = date);
            },
          ),
          TimeInput(
              context: context,
              timeStart: _timeStart,
              timeEnd: _timeEnd,
              onTimePicked: (timeStart, timeEnd) {
                log.trace(
                    'User picked startTime $timeStart and endtime $timeEnd');
                setState(() {
                  _timeStart = timeStart;
                  if (timeEnd.hour < timeStart.hour) {
                    _timeEnd = TimeOfDay(
                        hour: _timeStart.hour + 1, minute: _timeStart.minute);
                  } else if (timeEnd.hour == timeStart.hour &&
                      timeEnd.minute <= timeStart.minute) {
                    _timeEnd = TimeOfDay(
                        hour: _timeStart.hour + 1, minute: _timeStart.minute);
                  } else {
                    _timeEnd = timeEnd;
                  }
                });
              }),
          const OriginInput(),
          RadiusInput(
            value: _radius,
            onSelect: (newValue) => setState(() => _radius = newValue),
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
          CustomElevatedButton(label: 'Submit', onPressed: _onSubmit),
        ],
      ),
    );
  }
}
