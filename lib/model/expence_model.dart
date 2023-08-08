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
      required this.category,
      this.id});

  final String title;
  final double price;
  final DateTime date;
  final Category category;
  final int? id;

  String get formatedDate {
    return DateFormat.yMMMMd().format(date);
  }

  factory ExpenceModel.fromJson(Map<String, dynamic> json) => ExpenceModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        date: DateTime.parse(json['date']),
        category: _categoryFromString(json['category']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'date': date.toIso8601String(),
        'category': _categoryToString(category),
      };

  String _categoryToString(Category category) {
    return category.toString().split('.').last;
  }

  static Category _categoryFromString(String categoryString) {
    return Category.values.firstWhere(
      (cat) => cat.toString() == 'Category.$categoryString',
    );
  }
}

class ExpenceBucket {
  const ExpenceBucket({required this.category, required this.expences});

  final Category category;
  final List<ExpenceModel> expences;

  ExpenceBucket.forCategory(List<ExpenceModel> allExpences, this.category)
      : expences = allExpences
            .where((element) => element.category == category)
            .toList();

  double get totalExpence {
    double sum = 0;
    for (final expence in expences) {
      sum += expence.price;
    }
    return sum;
  }
}
