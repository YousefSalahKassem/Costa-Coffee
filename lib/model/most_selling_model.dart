import 'package:cloud_firestore/cloud_firestore.dart';

class MostSellingModel{

  late String name,image,description,rate,roastedType,id,details,category;
  late List<dynamic> content;
  late List<dynamic> size;

  MostSellingModel(
      {
      required this.name,
      required this.image,
      required this.description,
      required this.rate,
      required this.roastedType,
      required this.content,
      required this.size,
      required this.id,
      required this.details,
      required this.category
      });

  MostSellingModel.fromJson(Map<dynamic,dynamic>map){
    if (map.isEmpty) {
      return;
    }
    name = map['name'];
    image=map['image'];
    description=map['description'];
    rate=map['rate'];
    roastedType=map['roastedType'];
    content=map['content'];
    size=map['size'];
    id=map['id'];
    details=map['details'];
    category=map['category'];
  }

  List<MostSellingModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> map =
      snapshot.data() as Map<String, dynamic>;

      return MostSellingModel(
          name: map['name'],
          image: map['image'],
          description:map['description'],
          rate:map['rate'],
          roastedType:map['roastedType'],
          content:map['content'],
          size:map['size'],
          id:map['id'],
          details:map['details'],
          category:map['category']
      );
    }).toList();
  }

  toJson(){
    return{
      'name': name,
      'image':image,
      'description':description,
      'rate':rate,
      'roastedType':roastedType,
      'content':content.map((e) => e.toJson()).toList(),
      'size':size.map((e) => e.toJson()).toList(),
      'id':id,
      'details':details,
      'category':category
    };
  }
}
