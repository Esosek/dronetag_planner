import 'package:flutter/material.dart';

class FlightTimeInput extends StatelessWidget {
  const FlightTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.schedule,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        const Text('13:32 - 14:57'),
      ],
    );
  }
}
