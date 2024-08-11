import 'package:obhijuk/src/features/home/domain/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity {
  BalanceModel({
    super.message,
    super.balance,
  });

  BalanceModel copyWith({
    String? message,
    int? balance,
  }) =>
      BalanceModel(
        message: message ?? this.message,
        balance: balance ?? this.balance,
      );

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        message: json["message"],
        balance: json["balance"],
      );
}
