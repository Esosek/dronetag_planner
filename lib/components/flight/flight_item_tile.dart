import 'package:flutter/material.dart';

class FlightItemTile extends StatelessWidget {
  const FlightItemTile({super.key, required this.label, this.content});

  final String label;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          if (content != null)
            Text(
              content!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
