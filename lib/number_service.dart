import 'package:zadanie_rekrutacyjne/algorithm.dart';
import 'package:zadanie_rekrutacyjne/l10n/app_localizations.dart';

sealed class OutlierResult {}

class OutlierSuccess extends OutlierResult {
  final int outlier;
  OutlierSuccess(this.outlier);
}

class OutlierFailure extends OutlierResult {
  final String message;
  OutlierFailure(this.message);
}

class NumberService {
  OutlierResult findOutlier(String text, AppLocalizations appLocalizations) {
    if (text.isEmpty) {
      return OutlierFailure(appLocalizations.noDataError);
    }

    final parts = text.split(RegExp(r'[,\s]+'))..removeWhere((s) => s.isEmpty);

    final numbers = <int>[];
    for (final p in parts) {
      final v = int.tryParse(p);
      if (v == null) {
        return OutlierFailure(appLocalizations.invalidNumberError(p));
      }
      numbers.add(v);
    }

    final outlier = lookingForOutlierNumber(numbers);
    if (outlier == null) {
      return OutlierFailure(appLocalizations.noOutlierError);
    }

    return OutlierSuccess(outlier);
  }
}
