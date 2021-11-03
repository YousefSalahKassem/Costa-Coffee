class VoucherModel{

late String offer,code,userId,validation,percentage;

VoucherModel({required this.offer, required this.code, required this.userId, required this.validation,required this.percentage});

VoucherModel.fromJson(Map<dynamic, dynamic> map) {
  if (map.isEmpty) {
    return;
  }
  offer = map['offer'];
  code = map['code'];
  userId = map['userId'];
  validation = map['validation'];
  percentage = map['percentage'];
}

toJson() {
  return {
    'offer':offer,
    'code':code,
    'userId':userId,
    'validation':validation,
    'percentage':percentage,
  };
}
}
