import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _datePicker() {
    final first = DateTime(
        DateTime.now().year - 5, DateTime.now().month, DateTime.now().day);
    final last =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: first,
        lastDate: last);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
                    const Text("Select date"),
                    const SizedBox(height: 8),
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
                  onPressed: () {},
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
