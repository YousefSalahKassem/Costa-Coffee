import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService{

  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _usersCollectionRef =
  FirebaseFirestore.instance.collection('Users');

  Future<List<QueryDocumentSnapshot>> getUsers() async {
    var value = await _usersCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _mostSellingCollectionRef =
  FirebaseFirestore.instance.collection('mostSelling');

  Future<List<QueryDocumentSnapshot>> getMostSelling() async {
    var value = await _mostSellingCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _specialCollectionRef =
  FirebaseFirestore.instance.collection('specialOffers');

  Future<List<QueryDocumentSnapshot>> getSpecialOffer() async {
    var value = await _specialCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _vouchersCollectionRef =
  FirebaseFirestore.instance.collection('Vouchers');

  Future<List<QueryDocumentSnapshot>> getVouchers() async {
    var value = await _vouchersCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _ordersCollectionRef =
  FirebaseFirestore.instance.collection('Orders');

  Future<List<QueryDocumentSnapshot>> getOrders() async {
    var value = await _ordersCollectionRef.get();
    return value.docs;
  }

  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProducts(String category) async {
    var value = await _productCollectionRef.where('category',isEqualTo: category).get();
    print(category);
    return value.docs;
  }

  final CollectionReference _searchCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getSearch() async {
    var value = await _searchCollectionRef.get();
    return value.docs;
  }

}