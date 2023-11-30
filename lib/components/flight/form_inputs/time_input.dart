import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.schedule,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            '16:47',
          ),
        ),
        const Text(
          ' - ',
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            '17:47',
          ),
        ),
      ],
    );
  }
}
