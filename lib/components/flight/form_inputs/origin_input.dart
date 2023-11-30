import 'package:dronetag_planner/components/ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class OriginInput extends StatelessWidget {
  const OriginInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
