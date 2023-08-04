import 'package:flutter/material.dart';
import 'package:expences_tracker/model/expence_model.dart';
import 'package:expences_tracker/widgets/expences_item.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList(
      {super.key, required this.list, required this.onRemovedExpence});
  final void Function(ExpenceModel expence) onRemovedExpence;
  final List<ExpenceModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Colors.redAccent,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: const Icon(
            Icons.delete,
          ),
        ),
        key: ValueKey(index),
        onDismissed: (direction) {
          onRemovedExpence(list[index]);
        },
        child: ExpencesItem(
          expence: list[index],
        ),
      ),
    );
  }
}
