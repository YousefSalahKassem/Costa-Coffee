import 'cart_model.dart';

class OrderModel{
  late String userId,dateTime;
  late String street1,street2,state,city,country,phone,map,offer,total,status;
  late List<dynamic>products;
  OrderModel({required this.userId, required this.dateTime,required this.street1,required this.street2,required this.state,required this.city,required this.country , required this.products, required this.phone,required this.map,required this.offer,required this.total,required this.status});

  factory OrderModel.fromMap(Map<String,dynamic>map){
    return new OrderModel(userId: map['userId'], dateTime: map['dateTime'] , street1: map['street1'] as String, street2: map['street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,phone: map['phone'] as String ,offer: map['offer'] as String,map: map['map'] as String,total: map['total'] as String,products: map['products'], status: map['status'] as String);
  }
  Map<String,dynamic> toMap(){
    return {
      'userId' : this.userId,
      'dateTime' : this.dateTime,
      'street1' : this.street1,
      'street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'phone' : this.phone,
      'offer' : this.offer,
      'total' : this.total,
      'map' : this.map,
      'status' : this.status,
      'products' : products.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderModels{
  late String userId,dateTime;
  late String street1,street2,state,city,country,phone,map,offer,total,status;
  late List<dynamic>products;
  OrderModels({required this.userId, required this.dateTime,required this.street1,required this.street2,required this.state,required this.city,required this.country ,  required this.phone,required this.products,required this.map,required this.offer,required this.total,required this.status});

  factory OrderModels.fromMap(Map<dynamic,dynamic>map){
    return new OrderModels(userId: map['userId'], dateTime: map['dateTime'] , street1: map['street1'] as String, street2: map['street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,phone: map['phone'] as String ,products: map['products'],offer: map['offer'] as String,map: map['map'] as String,total: map['total'] as String,status: map['status']);
  }
  toMap(){
    return {
      'userId' : this.userId,
      'dateTime' : this.dateTime,
      'street1' : this.street1,
      'street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'phone' : this.phone,
      'offer' : this.offer,
      'total' : this.total,
      'map' : this.map,
      'status' : this.status,
      'products' : products
    };
  }
}
