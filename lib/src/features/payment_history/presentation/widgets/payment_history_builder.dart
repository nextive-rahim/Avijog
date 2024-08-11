part of '../pages/payment_history_page.dart';

class _PaymentHistoryBuilder extends StatelessWidget {
  const _PaymentHistoryBuilder({
    super.key,
    required this.paymentHistory,
  });
  final List<PaymentHistoryModel> paymentHistory;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: paymentHistory.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        PaymentHistoryModel paymentHistoryModel = paymentHistory[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _PaymentHistoryCard(paymentHistoryModel: paymentHistoryModel),
        );
      },
    );
  }
}
