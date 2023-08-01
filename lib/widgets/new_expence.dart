import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              )
            ],
          )
        ],
      ),
    );
  }
}
