import 'package:expences_tracker/widgets/new_expence.dart';
import 'package:flutter/material.dart';
import 'package:expences_tracker/model/expence_model.dart';

import 'package:expences_tracker/widgets/chart/chart.dart';

import '../service/database_helper.dart';
import 'expences_item.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late List<ExpenceModel> _registeredExpences = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  void _loadExpenses() async {
    final expenses = await DatabaseHelper.getAllExpences();
    if (expenses != null) {
      setState(() {
        _registeredExpences = expenses;
      });
    }
  }

  void _addExpence() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpence(onAddExpence: _registerExpence),
    );
  }

  void _registerExpence(ExpenceModel expence) async {
    await DatabaseHelper.addExpense(expence);
    _loadExpenses();
  }

  void _onRemovedExpence(ExpenceModel expence, BuildContext context) async {
    await DatabaseHelper.deleteExpense(expence);

    setState(() {
      _registeredExpences.remove(expence);
    });

    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () async {
          int undoResult = await DatabaseHelper.addExpense(expence);
          if (undoResult > 0) {
            _loadExpenses();
          }
          _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        },
      ),
    );

    _scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  @override
  Widget build(context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expences Tracker",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: _addExpence,
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Chart(
                expenses: _registeredExpences,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: _registeredExpences.length,
                itemBuilder: (context, index) => Dismissible(
                  background: Container(
                    color: Colors.redAccent,
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            Theme.of(context).cardTheme.margin!.horizontal),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.delete,
                    ),
                  ),
                  key: ValueKey(index),
                  onDismissed: (direction) {
                    _onRemovedExpence(_registeredExpences[index], context);
                  },
                  child: ExpencesItem(
                    expence: _registeredExpences[index],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
