import 'package:flutter/material.dart';
import 'package:expences_tracker/widgets/expences.dart';
import 'package:flutter/services.dart';

var KcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var KdarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (value) {
      runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: KdarkColorScheme,
            cardTheme: const CardTheme().copyWith(
              color: KdarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KdarkColorScheme.primaryContainer,
                  foregroundColor: KdarkColorScheme.onPrimaryContainer),
            ),
          ),
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
            textTheme: ThemeData().textTheme.copyWith(
                  titleMedium: TextStyle(
                      color: KcolorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
          ),
          themeMode: ThemeMode.system,
          home: const Expences(),
        ),
      );
    },
  );
}
