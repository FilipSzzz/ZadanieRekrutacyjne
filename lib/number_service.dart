import 'package:zadanie_rekrutacyjne/algorithm.dart';

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
  OutlierResult findOutlier(String text) {
    if (text.isEmpty) {
      return OutlierFailure('Brak danych');
    }

    final parts = text.split(RegExp(r'[,\s]+'))..removeWhere((s) => s.isEmpty);

    final numbers = <int>[];
    for (final p in parts) {
      final v = int.tryParse(p);
      if (v == null) {
        return OutlierFailure('Niepoprawna liczba: "$p"');
      }
      numbers.add(v);
    }

    final outlier = lookingForOutlierNumber(numbers);
    if (outlier == null) {
      return OutlierFailure('Brak odstającej liczby');
    }

    return OutlierSuccess(outlier);
  }
}
