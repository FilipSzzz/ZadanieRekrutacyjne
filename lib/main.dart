import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zadanie_rekrutacyjne/app_router.dart';
import 'package:zadanie_rekrutacyjne/result_provider.dart';
import 'package:zadanie_rekrutacyjne/service_locator.dart';
import 'l10n/app_localizations.dart';

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ResultProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      routerConfig: router,
    );
  }
}
