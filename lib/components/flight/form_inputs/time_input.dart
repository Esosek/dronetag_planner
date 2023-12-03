import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/flight/flight_form_field.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({
    super.key,
    required this.context,
    required this.timeStart,
    required this.timeEnd,
    required this.onTimePicked,
  });

  final BuildContext context;
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final Function(TimeOfDay timeStart, TimeOfDay timeEnd) onTimePicked;

  void _openTimePicker(bool isStartDate) async {
    final now = TimeOfDay.now();
    final pickedTime = await showTimePicker(context: context, initialTime: now);
    if (pickedTime != null) {
      isStartDate
          ? onTimePicked(pickedTime, timeEnd)
          : onTimePicked(timeStart, pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlightFormField(
      label: 'Time',
      content: Row(
        children: [
          Icon(
            Icons.schedule,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () => _openTimePicker(true),
            child: Text(
              '${timeStart.hour}:${timeStart.minute.toString().padLeft(2, '0')}',
            ),
          ),
          const Text(
            ' - ',
          ),
          OutlinedButton(
            onPressed: () => _openTimePicker(false),
            child: Text(
              '${timeEnd.hour}:${timeEnd.minute.toString().padLeft(2, '0')}',
            ),
          ),
        ],
      ),
    );
  }
}
