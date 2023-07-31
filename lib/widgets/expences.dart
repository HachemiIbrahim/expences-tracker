import 'package:expences_tracker/widgets/new_expence.dart';
import 'package:flutter/material.dart';
import 'package:expences_tracker/model/expence_model.dart';
import 'package:expences_tracker/widgets/expences_liste.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  // ignore: non_constant_identifier_names
  final List<ExpenceModel> _ReqisteredExpences = [
    ExpenceModel(
        title: "Flutter course",
        price: 20,
        date: DateTime.now(),
        category: Category.work),
    ExpenceModel(
        title: "Travel",
        price: 1200,
        date: DateTime.now(),
        category: Category.travel)
  ];
  // ignore: non_constant_identifier_names
  void _AddExpence() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NewExpence(),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expences Tracker",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 132, 39, 160),
        actions: [
          IconButton(
            onPressed: _AddExpence,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ExpencesList(list: _ReqisteredExpences),
            ),
          ],
        ),
      ),
    );
  }
}
