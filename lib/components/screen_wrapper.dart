import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    required this.body,
    this.screenTitle,
    this.bodyPadding,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final Widget body;
  final EdgeInsetsGeometry? bodyPadding;
  final String? screenTitle;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: screenTitle == null
            ? null
            : AppBar(
                title: Text(screenTitle!),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: Padding(
          padding: bodyPadding ?? const EdgeInsets.all(12),
          child: body,
        ),
      ),
    );
  }
}
