import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int number;

  const ResultPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$number',
          style: const TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
