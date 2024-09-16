import 'package:flutter/material.dart';

ThemeData buildMaterial3Theme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B73E8),
      brightness: Brightness.dark,
      primary: const Color(0xFF1B73E8),
      secondary: const Color(0xFFC7667A),
    ),
  );
}
