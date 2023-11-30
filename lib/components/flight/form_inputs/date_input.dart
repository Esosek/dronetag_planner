import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  const DateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          child: const Text('30.11.2023'),
        ),
      ],
    );
  }
}
