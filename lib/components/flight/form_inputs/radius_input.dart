import 'package:dronetag_planner/components/ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class RadiusInput extends StatelessWidget {
  const RadiusInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.adjust,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        const CustomTextField(hintText: '20'),
        const SizedBox(width: 4),
        const Text('meters'),
      ],
    );
  }
}
