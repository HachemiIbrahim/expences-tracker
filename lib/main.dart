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
      ),
      home: const Expences(),
    ),
  );
}
