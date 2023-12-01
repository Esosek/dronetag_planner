import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.step,
    required this.initialValue,
    required this.onSaved,
    this.units,
  });

  final int minValue;
  final int maxValue;
  final int step;
  final int initialValue;
  final Function(int) onSaved;
  final String? units;

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  late int _value;

  @override
  Widget build(BuildContext context) {
    _value = widget.initialValue;
    return StatefulBuilder(
      builder: (context, setModalState) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose radius',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.units != null) const Spacer(),
                Expanded(
                  flex: 1,
                  child: NumberPicker(
                    minValue: widget.minValue,
                    maxValue: widget.maxValue,
                    step: widget.step,
                    value: _value,
                    onChanged: (newValue) {
                      setModalState(() => _value = newValue);
                    },
                  ),
                ),
                if (widget.units != null)
                  Expanded(
                    child: Text(widget.units!),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            CustomElevatedButton(
                label: 'Save',
                onPressed: () {
                  Navigator.pop(context);
                  widget.onSaved(_value);
                }),
          ],
        ),
      ),
    );
  }
}
