import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costacoffe/model/cart_model.dart';
import 'package:costacoffe/service/cart_database_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  List<CartModel> get cartProductModel=>_cartProductModel;
  List<CartModel> _cartProductModel=[];
  double get totalprice=>_totalprice;
  double _totalprice=0.0;
  var dbHelper=CartDataBaseHelper.db;
  int get c=>count;
  int count=0;

  CartViewModel(){
    getAllProducts( );
  }

  getAllProducts()async{
    var dbHelper=CartDataBaseHelper.db;
    _cartProductModel=await dbHelper.getAllProdcut();
    getTotalPrice();
    update();
  }

  mycart(int index)async{
    var dbHelper = CartDataBaseHelper.db;
    count=_cartProductModel[index].quantity*_cartProductModel.length;
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
  getTotalPrice(){
    for(int i=0;i<_cartProductModel.length;i++){
      _totalprice+=double.parse(_cartProductModel[i].price)*_cartProductModel[i].quantity;
      update();
    }
  }
  addProduct(CartModel cartProductModel)async{
    for(int i=0;i<_cartProductModel.length;i++) {
      if (_cartProductModel[i].id == cartProductModel.id) {
        return;
      }
    }
    _cartProductModel.add(cartProductModel);
    var dbHelper=CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _totalprice+=double.parse(cartProductModel.price)*cartProductModel.quantity;
    count++;
    update();
  }
  decreaseQuntity(int index)async{
    if(_cartProductModel[index].quantity<=1){
      _cartProductModel[index].quantity=1;
    }
    else{
      _cartProductModel[index].quantity--;
      var dbHelper = CartDataBaseHelper.db;
      _totalprice -= double.parse(_cartProductModel[index].price);
      count-=1;
      mycart(index);

      await dbHelper.updateProduct(_cartProductModel[index]);
      update();
    }}
  increaseQuntity(int index)async{
    var dbHelper=CartDataBaseHelper.db;
    _cartProductModel[index].quantity++;
    _totalprice+=double.parse(_cartProductModel[index].price);
    count+=1;
    mycart(index);

    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  deleteproduct()async{
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.deleteProduct();
    _totalprice=0;
    update();
  }

  getproducts()async{
    FirebaseFirestore.instance.collection('order').doc(FirebaseAuth.instance.currentUser!.uid.toString()).set
      ({
      'list':_cartProductModel.toList()
    });

  }

}