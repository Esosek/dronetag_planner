import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/components/flight/form_inputs/date_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/time_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/origin_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/radius_input.dart';
import 'package:dronetag_planner/components/flight/form_inputs/altitude_input.dart';
import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/models/flight_location.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';

class FlightForm extends ConsumerStatefulWidget {
  const FlightForm({super.key});

  @override
  ConsumerState<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends ConsumerState<FlightForm> {
  final log = CustomLogger('FlightForm');
  final _formKey = GlobalKey<FormState>();

  late Device _activeDevice;
  DateTime _date = DateTime.now();
  TimeOfDay _timeStart = TimeOfDay.now();
  TimeOfDay _timeEnd =
      TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);
  late String _originLatitude;
  late String _originLongiude;
  int _radius = 50;
  int _minAltitude = 0;
  int _maxAltitude = 50;

  @override
  void initState() {
    super.initState();
    _activeDevice = ref.read(devicesProvider).firstWhere(
          (device) => device.isActive,
        );
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
        if (_minAltitude < 0) {
          _minAltitude = 0;
        }
      }
    });
  }

  void _onSubmit() async {
    if (!_isFormValid()) {
      log.debug('Validation failed');
      return;
    }

    final dateStart = DateTime(
        _date.year, _date.month, _date.day, _timeStart.hour, _timeStart.minute);

    final newFlight = Flight(
      device: _activeDevice,
      location: FlightLocation(
          latitude: double.parse(_originLatitude),
          longitude: double.parse(_originLongiude),
          radius: _radius),
      altitudeRange: [_minAltitude, _maxAltitude],
      dateStart: dateStart.toString(),
      dateEnd: _dateEnd.toString(),
    );

    log.debug(
        '${newFlight.device.uasId} ${newFlight.location.latitude.toString()} ${newFlight.location.longitude.toString()} ${newFlight.location.radius} ${newFlight.altitudeRange[0]} ${newFlight.altitudeRange[1]} ${newFlight.dateStart} ${newFlight.dateEnd}');
  }

  bool _isFormValid() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    _formKey.currentState!.save();
    return true;
  }

  DateTime get _dateEnd {
    DateTime dateEnd;

    if (_timeStart.hour > _timeEnd.hour ||
        (_timeStart.hour == _timeEnd.hour &&
            _timeStart.minute > _timeEnd.minute)) {
      // If _timeStart is later than _timeEnd on the same day, increment the day
      dateEnd = DateTime(
        _date.year,
        _date.month,
        _date.day + 1,
        _timeEnd.hour,
        _timeEnd.minute,
      );
    } else {
      dateEnd = DateTime(
        _date.year,
        _date.month,
        _date.day,
        _timeEnd.hour,
        _timeEnd.minute,
      );
    }
    return dateEnd;
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
              onTimePicked: (timeStart, timeEnd, isPickingStart) {
                log.trace(
                    'User picked startTime $timeStart and endtime $timeEnd');
                setState(() {
                  _timeStart = timeStart;
                  if (isPickingStart) {
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
                  } else {
                    _timeEnd = timeEnd;
                  }
                });
              }),
          OriginInput(
            onLatitudeSaved: (value) => _originLatitude = value ?? '',
            onLongitudeSaved: (value) => _originLongiude = value ?? '',
          ),
          RadiusInput(
            value: _radius,
            onSelect: (newValue) => setState(() => _radius = newValue),
          ),
          AltitudeInput(
            minAltitudeValue: _minAltitude,
            maxAltitudeValue: _maxAltitude,
            setMinAltitude: _setMinAltitude,
            setMaxAltitude: _setMaxAltitude,
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(label: 'Submit', onPressed: _onSubmit),
        ],
      ),
    );
  }
}
