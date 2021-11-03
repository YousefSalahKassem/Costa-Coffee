class CartModel{
  late String name,image,id,price,size,details;
  late int quantity;

  CartModel({required this.name,required this.image,required this.id,required this.price,required this.size,required this.quantity,required this.details});

  CartModel.fromJson(Map<dynamic,dynamic>map){
    if (map.isEmpty) {
      return;
    }
    name = map['name'];
    image=map['image'];
    size=map['size'];
    id=map['id'];
    price=map['price'];
    quantity=map['quantity'];
    details=map['details'];
  }

  toJson(){
    return{
      'name': name,
      'image': image,
      'price': price,
      'quantity' : quantity,
      'id' : id,
      'size' : size,
      'details':details,
    };
  }
}