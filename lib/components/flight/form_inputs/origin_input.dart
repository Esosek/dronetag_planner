import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';
import 'package:dronetag_planner/components/ui/custom_text_field.dart';

class OriginInput extends StatelessWidget {
  const OriginInput({super.key});

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
          const CustomTextField(
            hintText: 'Latitude',
          ),
          const Text(' , '),
          const CustomTextField(
            hintText: 'Longitude',
          ),
        ],
      ),
    );
  }
}
