import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dronetag_planner/screens/login_screen.dart';

final _theme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0CA7F4),
    primaryContainer: const Color(0xFF0CA7F4),
  ),
  textTheme: GoogleFonts.titilliumWebTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: _theme,
    );
  }
}
