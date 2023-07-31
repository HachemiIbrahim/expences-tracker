import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();

enum Category { food, travel, work, liesure }

const CategoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.liesure: Icons.gamepad_outlined
};

class ExpenceModel {
  ExpenceModel(
      {required this.title,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String title;
  final String id;
  final double price;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return DateFormat.yMMMMd().format(date);
  }
}
