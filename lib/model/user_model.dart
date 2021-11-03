class UserModel {
  late String userId, email, name, picture,phone;

  UserModel({required this.userId, required this.email, required this.name, required this.picture,required this.phone});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    picture = map['pic'];
    phone=map['phone'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': picture,
      'phone': phone,
    };
  }
}
