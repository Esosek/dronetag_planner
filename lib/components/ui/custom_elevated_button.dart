import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixWidth,
    this.enabled = true,
  });

  final Widget child;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fixWidth;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor:
              foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          minimumSize: const Size(90, 40),
        ),
        onPressed: enabled ? onPressed : null,
        child: child,
      ),
    );
  }
}
