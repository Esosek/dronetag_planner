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
            maxLength: 11,
            validator: (value) {
              const failText = 'Invalid';
              if (value == null) {
                return failText;
              }

              try {
                final double latitude = double.parse(value);

                if (latitude >= -90.0 && latitude <= 90.0) {
                  // Valid latitude within the range
                  return null;
                } else {
                  // Latitude is out of range
                  return failText;
                }
              } catch (e) {
                // Parsing error, not a valid double
                return failText;
              }
            },
            onSaved: onLatitudeSaved,
          ),
          const Text(' , '),
          CustomTextField(
            hintText: 'Longitude',
            maxLength: 11,
            validator: (value) {
              const failText = 'Invalid';
              if (value == null) {
                return failText;
              }

              try {
                final double longitude = double.parse(value);

                if (longitude >= -180.0 && longitude <= 180.0) {
                  // Valid latitude within the range
                  return null;
                } else {
                  // Latitude is out of range
                  return failText;
                }
              } catch (e) {
                // Parsing error, not a valid double
                return failText;
              }
            },
            onSaved: onLongitudeSaved,
          ),
        ],
      ),
    );
  }
}
