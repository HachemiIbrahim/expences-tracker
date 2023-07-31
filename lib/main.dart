import 'package:flutter/material.dart';
import 'package:expences_tracker/widgets/expences.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expences(),
    ),
  );
}
