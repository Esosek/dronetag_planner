import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixWidth,
  });

  final Widget child;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fixWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          minimumSize: const Size(90, 40),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
