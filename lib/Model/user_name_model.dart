class UserNameModel{
  String ? uid;

  UserNameModel({required this.uid});

  UserNameModel.fromJson(Map<String,dynamic> json){
    uid=json['uid'];
  }
}