import 'package:flutter/material.dart';

class ResultProvider with ChangeNotifier {
  int? _number;

  int? get number => _number;

  void setNumber(int number) {
    _number = number;
    notifyListeners();
  }
}
