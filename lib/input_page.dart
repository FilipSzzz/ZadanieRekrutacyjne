import 'package:flutter/material.dart';
import 'algorithm.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  final controller = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _processInput() {
    setState(() => errorMessage = null);

    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() => errorMessage = 'Brak danych');
      return;
    }

    final parts = text.split(RegExp(r'[,\s]+'))..removeWhere((s) => s.isEmpty);

    final numbers = <int>[];
    for (final p in parts) {
      final v = int.tryParse(p);
      if (v == null) {
        setState(() => errorMessage = 'Niepoprawna liczba: "$p"');
        return;
      }
      numbers.add(v);
    }

    final outlier = lookingForOutlierNumber(numbers);
    if (outlier == null) {
      setState(() => errorMessage = 'Brak odstającej liczby');
      return;
    }
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ResultPage(number: outlier)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _processInput,
            child: const Text('Wyszukaj'),
          ),
          const SizedBox(height: 12),
          if (errorMessage != null)
            Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
        ],
      ),
    );
  }
}
