import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.onSaved,
    this.maxLength,
  });

  final String? hintText;
  final String? Function(String? value)? validator;
  final Function(String? value)? onSaved;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: maxLength,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
