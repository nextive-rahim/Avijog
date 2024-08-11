import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commissionCalculationProvider =
    ChangeNotifierProvider<CommissionCalculationProvider>(
        (ref) => CommissionCalculationProvider());

class CommissionCalculationProvider extends ChangeNotifier {
  int commission = 0;
  int yourSellingPrice = 0;
  int needToPay = 0;
  double percentage = 10;

  void commissionCalculation(String sellingPrice) {
    yourSellingPrice = double.parse(sellingPrice).toInt();
    commission = ((percentage / 100) * double.parse(sellingPrice)).toInt();
    needToPay = (double.parse(sellingPrice) - commission).toInt();

    notifyListeners();
  }
}
