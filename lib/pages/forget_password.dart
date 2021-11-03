import 'package:costacoffe/pages/control_screen.dart';
import 'package:costacoffe/service/notification_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('images/Forgot password-amico.svg',height: 300,width: 300,),
              Text('Forgot You Password ?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
              const SizedBox(height: 8,),
              Text('Enter your email address and we will send you',style: TextStyle(color: Colors.white),),
              Text('a link to reset your password',style: TextStyle(color: Colors.white),),
              const SizedBox(height: 15,),
              Padding(
                padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                child: TextFormField(
                  controller: email,
                  style: const TextStyle(color: Colors.white),
                  decoration:const  InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF474747))
                    ),
                    hintText: 'Email',
                    hintStyle:  TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                    fillColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF474747))
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF474747))
                    ),
                  ),),
              ),
              const SizedBox(height:50,),
              Padding(
                padding: const EdgeInsets.only(right: 40.0,left: 40.0),
                child: InkWell(
                    onTap: () async {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text).whenComplete(() {
                      NotificationApi.showNotification(
                        title: 'Reset Successfully !',
                        body: 'you can check your email now to reset password !',
                        payload: 'reset',
                        id: 1,
                      );
                      Get.offAll(const ControlScreen());
                    });
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFF6F2A3B)),width: MediaQuery.of(context).size.width,height: 50,child: Center(child: const Text('Reset',style: TextStyle(color: Colors.white,fontSize: 20),)),)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
