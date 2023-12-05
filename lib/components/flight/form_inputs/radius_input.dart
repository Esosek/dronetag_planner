import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_number_picker.dart';

class RadiusInput extends StatelessWidget {
  const RadiusInput({
    super.key,
    required this.value,
    required this.onSelect,
  });

  final int value;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return FlightFormField(
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
                  label: 'Choose radius',
                  minValue: 10,
                  maxValue: 5000,
                  step: 10,
                  units: 'meters',
                  initialValue: value,
                  onSaved: onSelect,
                ),
              );
            },
            child: Text(value.toString()),
          ),
          const SizedBox(width: 4),
          const Text('meters'),
        ],
      ),
    );
  }
}
