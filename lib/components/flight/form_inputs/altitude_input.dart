import 'package:dronetag_planner/components/ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class AltitudeInput extends StatelessWidget {
  const AltitudeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.height,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        const CustomTextField(
          hintText: 'Min',
        ),
        const Text(' - '),
        const CustomTextField(
          hintText: 'Max',
        ),
        const SizedBox(width: 4),
        const Text('meters'),
      ],
    );
  }
}
