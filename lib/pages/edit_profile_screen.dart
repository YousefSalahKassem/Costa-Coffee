import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costacoffe/model/user_model.dart';
import 'package:costacoffe/pages/person_profile_screen.dart';
import 'package:costacoffe/service/send_data.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6F2A3B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Edit Profile',style: TextStyle(color: Colors.white,fontSize:18 ),),
        leading:  IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const PersonProfileScreen(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),

      ),
      body: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder:(controller){

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height*.35,
                      width: MediaQuery.of(context).size.width,
                      color:  const Color(0xFF6F2A3B),
                      child: Center(child: Stack(children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 60,
                            backgroundImage: NetworkImage(controller.userModel[0].picture==null?'https://firebasestorage.googleapis.com/v0/b/costacoffee-9fe9a.appspot.com/o/costa.png?alt=media&token=bce324a5-ff9e-426e-beda-ac61084310ed':controller.userModel[0].picture),
                          ),
                        ),

                      ],),)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('Username',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      controller: name,
                      style: const TextStyle(color: Colors.white),
                      decoration:  const InputDecoration(
                        hintText: 'name',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('Email',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                      decoration:const  InputDecoration(
                        hintText: 'Email',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('phone',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      controller: phone,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),

                ],
              ),
            );
          }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 45.0,right: 45,bottom: 10,top: 35),
          child: BottomAppBar(color: Colors.transparent,
            child: InkWell(
              onTap: (){
                FireStoreUser().addUserToFireStore(UserModel(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  email: FirebaseAuth.instance.currentUser!.email.toString(),
                  name:  name.text,
                  picture: FirebaseAuth.instance.currentUser!.photoURL.toString(),
                  phone: phone.text,
                ));
                Navigator.pushReplacement(context, PageTransition(child: const PersonProfileScreen(), type: PageTransitionType.rightToLeft));
              },
              child: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(color:const Color(0xFF6F2A3B),borderRadius: BorderRadius.circular(20)),
                child: const Center(child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),),
            ),),
      ),
    );
  }
}
