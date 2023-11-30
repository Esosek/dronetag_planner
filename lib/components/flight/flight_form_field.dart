import 'package:flutter/material.dart';

class FlightFormField extends StatelessWidget {
  const FlightFormField({
    super.key,
    required this.label,
    required this.content,
  });

  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 4,
            child: content,
          ),
        ],
      ),
    );
  }
}
