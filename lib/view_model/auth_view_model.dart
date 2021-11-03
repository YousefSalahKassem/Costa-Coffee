
import 'package:costacoffe/model/user_model.dart';
import 'package:costacoffe/pages/control_screen.dart';
import 'package:costacoffe/pages/home_screen.dart';
import 'package:costacoffe/service/send_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(const ControlScreen());
    });
  }

  // void facebookSignInMethod() async {
  //   final AccessToken result = await FacebookAuth.instance.login();
  //
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);
  //
  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUser(user);
  //   });
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(ControlScreen());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword(String email,String password,String name,String phone) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: FirebaseAuth.instance.currentUser!.uid,
          email: email,
          name:  name,
          picture: 'https://firebasestorage.googleapis.com/v0/b/costacoffee-9fe9a.appspot.com/o/costa.png?alt=media&token=bce324a5-ff9e-426e-beda-ac61084310ed',
          phone: phone,
        ));
      });

      Get.offAll(ControlScreen());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: FirebaseAuth.instance.currentUser!.uid,
      email: FirebaseAuth.instance.currentUser!.email.toString(),
      name:  FirebaseAuth.instance.currentUser!.displayName.toString(),
      picture: FirebaseAuth.instance.currentUser!.photoURL.toString(),
      phone:FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
    ));
  }
}
