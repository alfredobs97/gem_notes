import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildMaterial3Theme() {
  final gowunTextTheme = GoogleFonts.gowunBatangTextTheme(ThemeData(brightness: Brightness.dark).textTheme);
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B73E8),
      brightness: Brightness.dark,
      primary: const Color(0xFF1B73E8),
      secondary: const Color(0xFFC7667A),
      secondaryContainer: const Color.fromARGB(255, 244, 19, 64),
    ),
    textTheme: ThemeData(
      brightness: Brightness.dark,
    ).textTheme.copyWith(
        displayLarge: gowunTextTheme.displayLarge,
        displayMedium: gowunTextTheme.displayMedium,
        displaySmall: gowunTextTheme.displaySmall,
        headlineLarge: gowunTextTheme.headlineLarge,
        headlineMedium: gowunTextTheme.headlineMedium,
        headlineSmall: gowunTextTheme.headlineSmall),
  );
}
