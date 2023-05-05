
class PaymentHistoryModel {
  String? name;
  String? time;
  String? date;
  String? image;
  double? sent;
  double? recieved;
  PaymentHistoryModel(
      {required this.name,
      required this.time,
      required this.sent,
      required this.date,
      required this.image,
      required this.recieved});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    sent = json['sent'];
    recieved = json['recieved'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'time': time, 'sent': sent, 'recieved': recieved,'image':image,'date':date};
  }
}
