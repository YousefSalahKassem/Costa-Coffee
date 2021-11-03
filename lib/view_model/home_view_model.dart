import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costacoffe/model/category_model.dart';
import 'package:costacoffe/model/most_selling_model.dart';
import 'package:costacoffe/model/order_model.dart';
import 'package:costacoffe/model/user_model.dart';
import 'package:costacoffe/model/voucher_model.dart';
import 'package:costacoffe/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<UserModel> get userModel => _userModel;
  final List<UserModel> _userModel = [];

  List<MostSellingModel> get mostSellingModel => _mostSellingModel;
  final List<MostSellingModel> _mostSellingModel = [];

  List<MostSellingModel> get specialModel => _specialModel;
  final List<MostSellingModel> _specialModel = [];

  List<VoucherModel> get vouchers => _vouchers;
  final List<VoucherModel> _vouchers=[] ;

  List<MostSellingModel> get productModel => _productModel;
  final List<MostSellingModel> _productModel = [];

  List<OrderModels> get orderModel => _orderModel;
  final List<OrderModels> _orderModel=[] ;

  List<MostSellingModel> get searchModel => _searchModel;
  final List<MostSellingModel> _searchModel = [];

  var Category;

  HomeViewModel() {
    getCategory();
    getUsers();
    getMostSelling();
    getSpecialOffers();
    getVouchers();
    getProducts();
    getOrders();
    getSearch();
    Category;
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getUsers()async{
    _loading.value = true;
    HomeService().getUsers().then((value) {
      for (int i = 0; i < value.length; i++) {
        if(value[i]['userId']==FirebaseAuth.instance.currentUser!.uid){
        _userModel.add(UserModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        print(_userModel[0].picture.toString());
        _loading.value = false;}
      }
      update();
    });
  }

  getMostSelling()async{
    _loading.value = true;
    HomeService().getMostSelling().then((value) {
     for(int i=0;i<value.length;i++){
       _mostSellingModel.add(MostSellingModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
       _loading.value = false;
     }
      update();
    });
  }

  getSpecialOffers()async{
    _loading.value = true;
    HomeService().getSpecialOffer().then((value) {
      for(int i=0;i<value.length;i++){
        _specialModel.add(MostSellingModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }


  getVouchers()async{
    HomeService().getVouchers().then((value) {
      for(int i=0;i<value.length;i++){
        if(value[i]['userId']==FirebaseAuth.instance.currentUser!.uid.toString()) {
          _vouchers.add(VoucherModel.fromJson(
              value[i].data() as Map<dynamic, dynamic>));
        }
        else if (value[i]['userId']=='All'){
          _vouchers.add(VoucherModel.fromJson(
              value[i].data() as Map<dynamic, dynamic>));
        }
      }
      update();
    });
  }


  Future getOrders() async {
    HomeService().getOrders().then((List<QueryDocumentSnapshot<Object?>>value) {
      for (int i = 0; i < value.length; i++) {
        if(value[i]['userId']==FirebaseAuth.instance.currentUser!.uid.toString()) {
          _orderModel.add(OrderModels.fromMap(value[i].data() as Map<dynamic,dynamic>));
        }
      }
      update();
    });
  }

  getProducts()async{
    _loading.value = true;
    HomeService().getProducts(Category).then((value) {
      for(int i=0;i<value.length;i++){
        _productModel.add(MostSellingModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getSearch()async{
    _loading.value = true;
    HomeService().getSearch().then((value) {
      for(int i=0;i<value.length;i++){
        _searchModel.add(MostSellingModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}