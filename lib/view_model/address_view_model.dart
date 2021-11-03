import 'package:costacoffe/model/address_model.dart';
import 'package:costacoffe/service/addresses_database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressViewModel extends GetxController{

  List<AddressInfo> get addressInfo=>_addressInfo;
  List<AddressInfo> _addressInfo=[];
  var street1,street2,city,state,country,map;
  GlobalKey<FormState> formstate=GlobalKey();

AddressViewModel(){
  getAllProducts( );
}

  getAllProducts()async{
    var dbHelper=addressDatabaseHelper.db;
    _addressInfo=await dbHelper.getAllProdcut();
    update();
  }
  addtoaddresslist(AddressInfo addressInfo)async{
    _addressInfo.add(addressInfo);
    var dbHelper=addressDatabaseHelper.db;
    await dbHelper.insert(addressInfo);
    update();
  }

}