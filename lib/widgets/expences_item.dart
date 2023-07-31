import 'package:expences_tracker/model/expence_model.dart';
import 'package:flutter/material.dart';

class ExpencesItem extends StatelessWidget {
  const ExpencesItem({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Text(
              expence.title,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('${expence.price.toStringAsFixed(2)}\$'),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expence.category]),
                    const SizedBox(height: 9),
                    Text(expence.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
