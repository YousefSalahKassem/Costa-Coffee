import 'package:costacoffe/pages/signup_screen.dart';
import 'package:costacoffe/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends GetWidget<AuthViewModel>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 25.0,top: 100),
                child: Text('What goes best\nwith a cup of coffee?\nAnother cup.',style: TextStyle(color: Colors.white,fontSize: 29),),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextFormField(
                  onSaved:(value) {
                    controller.email = value!;
                  } ,
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
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
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextFormField(
                  onSaved:(value) {
                    controller.password = value!;
                  } ,
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF474747))
                    ),
                    focusedBorder:
                    UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF474747))
                    ),
                    hintStyle:  TextStyle(
                      color: Colors.grey,

                    ),
                    fillColor: Colors.black,
                    // Here is key idea
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient:const LinearGradient(
                        begin: Alignment.topCenter,
                        end:
                        Alignment(0.5, 0.0), // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          Color(0xFFDC143C),
                          Color(0xFFEE2756)
                        ], // red to yellow
                      ),),
                      child: InkWell(
                        onTap: (){
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword();
                          }
                        },
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('Login',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                            Icon(Icons.arrow_forward,color: Colors.white,),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: ()=>Navigator.pushReplacement(context, PageTransition(child: SignUpScreen(), type: PageTransitionType.rightToLeft)),
                      child: Column(children: const[
                        Text('New to Costa Coffee?',style: TextStyle(color:Colors.white),),
                        Text('Create Account',style: TextStyle(color:Color(0xFFA80000),fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,left: 25),
                    child: Column(
                      children:  [
                        const Text('You can Login with',style: TextStyle(color:Colors.white),),
                        const SizedBox(height: 10,),
                        Row(children: [
                          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.facebook,color:Color(0xFFEE2756),size: 30,)),
                          IconButton(onPressed: (){controller.googleSignInMethod();}, icon: const Icon(FontAwesomeIcons.google,color:Color(0xFFEE2756),size: 30,))
                        ],),
                      ],
                    ),
                  ),
                  Image.asset('images/costacoffee.png',width: MediaQuery.of(context).size.width*.3,height: MediaQuery.of(context).size.height*.3,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

