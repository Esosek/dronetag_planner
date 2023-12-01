import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    super.key,
    required this.value,
    required this.context,
    required this.onDatePicked,
  });

  final DateTime value;
  final BuildContext context;
  final Function(DateTime?) onDatePicked;

  void _openDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    onDatePicked(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = '${value.day}.${value.month}.${value.year}';
    return FlightFormField(
      label: 'Date',
      content: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: _openDatePicker,
            child: Text(formattedDate),
          ),
        ],
      ),
    );
  }
}
