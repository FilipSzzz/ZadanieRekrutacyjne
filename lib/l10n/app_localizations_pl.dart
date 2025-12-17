// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Zadanie rekrutacyjne';

  @override
  String get submit => 'Zatwierdź';

  @override
  String get result => 'Wynik';

  @override
  String resultMessage(int number) {
    return 'Odstająca liczba to $number';
  }

  @override
  String get resultMessagePrefix => 'Odstająca liczba to';
}
