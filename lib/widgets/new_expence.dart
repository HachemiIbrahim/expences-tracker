import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
        ],
      ),
    );
  }
}
