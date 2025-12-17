// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Recruitment Task';

  @override
  String get submit => 'Submit';

  @override
  String get result => 'Result';

  @override
  String resultMessage(int number) {
    return 'The outlier number is $number';
  }

  @override
  String get resultMessagePrefix => 'The outlier number is';
}
