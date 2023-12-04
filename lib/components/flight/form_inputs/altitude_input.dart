import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_number_picker.dart';

class AltitudeInput extends StatelessWidget {
  const AltitudeInput({
    super.key,
    required this.minAltitudeValue,
    required this.maxAltitudeValue,
    required this.setMinAltitude,
    required this.setMaxAltitude,
  });

  final int minAltitudeValue;
  final int maxAltitudeValue;
  final Function(int) setMinAltitude;
  final Function(int) setMaxAltitude;

  @override
  Widget build(BuildContext context) {
    return FlightFormField(
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
                maxValue: 2950,
                step: 10,
                initialValue: minAltitudeValue,
                onSaved: setMinAltitude,
              ),
            ),
            child: Text(minAltitudeValue.toString()),
          ),
          const Text(' - '),
          OutlinedButton(
            onPressed: () => showBottomSheet(
              context: context,
              enableDrag: false,
              builder: (context) => CustomNumberPicker(
                minValue: 0,
                maxValue: 3000,
                step: 10,
                initialValue: maxAltitudeValue,
                onSaved: setMaxAltitude,
              ),
            ),
            child: Text(maxAltitudeValue.toString()),
          ),
          const SizedBox(width: 4),
          const Text('meters'),
        ],
      ),
    );
  }
}
