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
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpence(onAddExpence: _RegisterExpence),
    );
  }

  void _RegisterExpence(ExpenceModel expence) {
    setState(() {
      _ReqisteredExpences.add(expence);
    });
  }

  void _OnRemovedExpence(ExpenceModel expence) {
    final _expenceIndex = _ReqisteredExpences.indexOf(expence);
    setState(() {
      _ReqisteredExpences.remove(expence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _ReqisteredExpences.insert(_expenceIndex, expence);
          });
        },
      ),
    ));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expences Tracker",
          style: TextStyle(color: Colors.white),
        ),
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
              child: ExpencesList(
                  onRemovedExpence: _OnRemovedExpence,
                  list: _ReqisteredExpences),
            ),
          ],
        ),
      ),
    );
  }
}
