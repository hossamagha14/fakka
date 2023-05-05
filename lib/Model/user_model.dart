import 'package:fakka/Model/payment_history_model.dart';

import 'notifications_model.dart';

class UserModel {
  String? name;
  String? cardHolderName;
  String? email;
  String? image;
  String? creditCardNumber;
  String? cardPassword;
  String? expiryDate;
  String? cvc;
  double money = 5;
  double recievedMoney = 0;
  double paidMoney = 0;
  bool cardIsLocked = false;
  List<PaymentHistoryModel> payments = [];
  List<NotificationsModel> notifications = [];

  UserModel(
      {required this.name,
      required this.email,
      required this.image,
      required this.cardPassword,
      required this.cvc,
      required this.creditCardNumber,
      required this.cardHolderName,
      required this.expiryDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    money = json['money'];
    image = json['image'];
    cardPassword = json['Card password'];
    cvc = json['CVC'];
    recievedMoney = json['Recieved money'];
    paidMoney = json['Paid money'];
    cardHolderName = json['Card holder name'];
    expiryDate = json['Expiry date'];
    creditCardNumber = json['Credit Card Number'];
    cardIsLocked = json['Locked'];
    payments = List<PaymentHistoryModel>.from(
        json['payments'].map((x) => PaymentHistoryModel.fromJson(x)));
    notifications = List<NotificationsModel>.from(
        json['notifications'].map((e) => NotificationsModel.fromJson(e)));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'money': money,
      'image': image,
      'Card password': cardPassword,
      'CVC': cvc,
      'Recieved money': recievedMoney,
      'Credit Card Number': creditCardNumber,
      'Card holder name': cardHolderName,
      'Expiry date': expiryDate,
      'Paid money': paidMoney,
      'Locked': cardIsLocked,
      "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
      'notifications': List<dynamic>.from(notifications.map((e) => e.toJson()))
    };
  }
}
