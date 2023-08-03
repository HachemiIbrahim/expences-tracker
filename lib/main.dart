import 'package:flutter/material.dart';
import 'package:expences_tracker/widgets/expences.dart';

var KcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: KcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: KcolorScheme.onPrimaryContainer,
            foregroundColor: KcolorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: KcolorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KcolorScheme.primaryContainer,
          ),
        ),
      ),
      home: const Expences(),
    ),
  );
}
