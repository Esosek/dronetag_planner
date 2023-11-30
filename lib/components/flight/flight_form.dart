import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/components/ui/custom_text_field.dart';
import 'package:dronetag_planner/components/flight/flight_form_field.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({super.key});

  @override
  State<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlightFormField(
            label: 'Date',
            content: Row(
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
            ),
          ),
          FlightFormField(
            label: 'Time',
            content: Row(
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
            ),
          ),
          FlightFormField(
            label: 'Origin',
            content: Row(
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
            ),
          ),
          FlightFormField(
            label: 'Radius',
            content: Row(
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
            ),
          ),
          FlightFormField(
            label: 'Altitude',
            content: Row(
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
            ),
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(label: 'Submit', onPressed: () {}),
        ],
      ),
    );
  }
}
