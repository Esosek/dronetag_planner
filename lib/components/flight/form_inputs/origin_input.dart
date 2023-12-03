import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_text_field.dart';

class OriginInput extends StatelessWidget {
  const OriginInput({
    super.key,
    required this.onLatitudeSaved,
    required this.onLongitudeSaved,
  });

  final Function(String? value)? onLatitudeSaved;
  final Function(String? value)? onLongitudeSaved;

  @override
  Widget build(BuildContext context) {
    return FlightFormField(
      label: 'Origin',
      content: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          CustomTextField(
            hintText: 'Latitude',
            validator: (value) {
              // TODO: Add Latitude validator
              return null;
            },
            onSaved: onLatitudeSaved,
          ),
          const Text(' , '),
          CustomTextField(
            hintText: 'Longitude',
            validator: (value) {
              // TODO: Add Longitude validator
              return null;
            },
            onSaved: onLongitudeSaved,
          ),
        ],
      ),
    );
  }
}
