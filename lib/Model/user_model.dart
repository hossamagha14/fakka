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
  String? address;
  String? nationalId;
  String? birthday;
  String? cvc;
  bool? isMale;
  bool? isVendor;
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
      required this.isMale,
      required this.isVendor,
      required this.birthday,
      required this.nationalId,
      required this.address,
      required this.cardPassword,
      required this.cvc,
      required this.creditCardNumber,
      required this.cardHolderName,
      required this.expiryDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    money = json['money'];
    isVendor = json['isVendor'];
    birthday = json['birthday'];
    nationalId = json['nationalId'];
    address = json['address'];
    isMale = json['isMale'];
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
      'birthday': birthday,
      'nationalId': nationalId,
      'address': address,
      'isVendor': isVendor,
      'isMale': isMale,
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
