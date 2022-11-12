import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.billPerPerson});

  final double billPerPerson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILL PER PERSON"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            billPerPerson.ceil().toString(),
            style: const TextStyle(fontSize: 100),
          ),
        ],
      ),
    );
  }
}