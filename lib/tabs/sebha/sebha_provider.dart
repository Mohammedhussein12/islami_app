import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int sebhaCount = 0;
  String sebhaWord = 'سبحان الله';
  double angle = 0;

  void rotateSebha() {
    angle += 20;
    sebhaCount = sebhaCount + 1;
    int cycleCount = sebhaCount % 99;
    if (cycleCount <= 33 && cycleCount > 0) {
      sebhaWord = 'سبحان الله';
    } else if (cycleCount > 33 && cycleCount <= 66) {
      sebhaWord = 'الحمد لله';
    } else if (cycleCount > 66 && cycleCount <= 99) {
      sebhaWord = 'الله اكبر';
    }
    notifyListeners();
  }
}
