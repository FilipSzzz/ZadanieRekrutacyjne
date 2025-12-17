import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:zadanie_rekrutacyjne/l10n/app_localizations.dart';
import 'package:zadanie_rekrutacyjne/number_service.dart';
import 'package:zadanie_rekrutacyjne/result_provider.dart';
import 'package:zadanie_rekrutacyjne/service_locator.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  final controller = TextEditingController();
  final numberService = getIt<NumberService>();
  String? errorMessage;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _processInput() {
    setState(() => errorMessage = null);
    final l10n = AppLocalizations.of(context)!;
    final result = numberService.findOutlier(controller.text.trim(), l10n);

    switch (result) {
      case OutlierSuccess(outlier: final outlier):
        Provider.of<ResultProvider>(context, listen: false).setNumber(outlier);
        context.go('/result');
      case OutlierFailure(message: final message):
        setState(() => errorMessage = message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _processInput,
                child: Text(l10n.submit),
              ),
              const SizedBox(height: 12),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
