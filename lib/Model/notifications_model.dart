class NotificationsModel {
  String? userName;
  String? image;
  String? date;
  double? money;
  bool opened = false;
  NotificationsModel({required this.userName, required this.money, required this.image, required this.date});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    userName = json['User name'];
    money = json['Requested money'];
    image = json['image'];
    opened = json['opened'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'User name': userName,
      'Requested money': money,
      'opened': opened,
      'image': image,
      'date': date,
    };
  }
}
