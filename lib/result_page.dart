import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zadanie_rekrutacyjne/result_provider.dart';
import 'l10n/app_localizations.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final number = Provider.of<ResultProvider>(context).number;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.result),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.resultMessagePrefix,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              '${number ?? ''}',
              style: const TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
