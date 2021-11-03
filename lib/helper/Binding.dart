
import 'package:costacoffe/view_model/address_view_model.dart';
import 'package:costacoffe/view_model/auth_view_model.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => AddressViewModel());
  }
}
