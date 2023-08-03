import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expences_tracker/model/expence_model.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpence});
  final void Function(ExpenceModel expence) onAddExpence;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State<NewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _chosedCategory = Category.food;
  DateTime? _pickedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _datePicker() async {
    final first = DateTime(
        DateTime.now().year - 5, DateTime.now().month, DateTime.now().day);
    final last =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final Date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: first,
        lastDate: last);
    setState(() {
      _pickedDate = Date;
    });
  }

  void _submitExpence() {
    final amount = double.tryParse(_amountController.text);
    final isInvalid = amount == null || amount < 0;
    if (_titleController.text.trim().isEmpty ||
        isInvalid ||
        _pickedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("alert"),
          content: const Text("Make sure to enter a valid data"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okey"),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpence(ExpenceModel(
        title: _titleController.text,
        price: amount,
        date: _pickedDate!,
        category: _chosedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      _pickedDate == null
                          ? "Select Date"
                          : DateFormat.yMMMMd().format(_pickedDate!),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _chosedCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _chosedCategory = value;
                      });
                    }
                  }),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 6, right: 8),
                child: ElevatedButton(
                  onPressed: _submitExpence,
                  child: const Text("Save"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
