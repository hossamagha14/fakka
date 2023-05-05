import 'package:fakka/Model/payment_history_model.dart';

class PaymentByDateModel {
  String? date;
  List<PaymentHistoryModel> paymentsHistory = [];

  PaymentByDateModel({required this.date});
}
