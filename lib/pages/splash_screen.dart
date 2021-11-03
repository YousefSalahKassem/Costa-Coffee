import 'dart:async';

import 'package:costacoffe/pages/control_screen.dart';
import 'package:costacoffe/pages/home_screen.dart';
import 'package:costacoffe/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
Timer(const Duration(seconds: 3), ()=>FirebaseAuth.instance.currentUser==null?Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft)):Navigator.pushReplacement(context, PageTransition(child: ControlScreen(), type: PageTransitionType.rightToLeft)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body:  Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:
              Alignment(0.95, 0.0), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                Color(0xFF6F2A3B),
                Colors.black
              ], // red to yellow
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Image.asset('images/costa.png',height: MediaQuery.of(context).size.height*.5,width: MediaQuery.of(context).size.width*.5,),
              ),
              const Spacer(),
               Text('Presented by Costa Coffee',style: TextStyle(color:Color(0xFFEE2756),fontSize: 12.sp
              ),),
              const SizedBox(height: 5,),
               Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('https://www.facebook.com/CostaCoffeeEgypt/',style: TextStyle(color:Color(0xFFEE2756),fontSize: 12.sp
                ),),
              ),

            ],
          ),
        ),
      ),);
  }
}
