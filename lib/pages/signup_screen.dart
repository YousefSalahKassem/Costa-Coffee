import 'package:costacoffe/pages/login_screen.dart';
import 'package:costacoffe/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();

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
                    controller: email,
                    onSaved:(value) {
                      email.text = value!;
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
                padding: EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextFormField(
                    onSaved:(value) {
                      name.text = value!;
                    } ,
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  style:const TextStyle(color: Colors.white),
                  decoration:const InputDecoration(
                    hintText: 'Username',
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
                padding: EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextFormField(
                    onSaved:(value) {
                      phone.text = value!;
                    } ,
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
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
                padding:  EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextFormField(
                    onSaved:(value) {
                      password.text = value!;
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
                    GestureDetector(
                      onTap: (){  _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword(email.text, password.text, name.text, phone.text);
                      }
                      },
                      child: Container(
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
                        child:
                        Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                            Icon(Icons.arrow_forward,color: Colors.white,),
                          ],
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: ()=>Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.leftToRight)),
                      child: Column(children: const[
                        Text('Already have an account?',style: TextStyle(color:Colors.white),),
                        Text('Sign in',style: TextStyle(color:Color(0xFFA80000),fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

