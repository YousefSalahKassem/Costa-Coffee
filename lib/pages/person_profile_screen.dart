import 'package:costacoffe/pages/control_screen.dart';
import 'package:costacoffe/pages/edit_profile_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class PersonProfileScreen extends StatefulWidget {
  const PersonProfileScreen({Key? key}) : super(key: key);

  @override
  _PersonProfileScreenState createState() => _PersonProfileScreenState();
}

class _PersonProfileScreenState extends State<PersonProfileScreen> {
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
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize:18 ),),
        leading:  IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: ControlScreen(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),

        actions:  [

          InkWell(
            onTap: ()=>Navigator.pushReplacement(context, PageTransition(child: EditProfileScreen(), type: PageTransitionType.rightToLeft)),
            child:const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Edit',style: TextStyle(color: Colors.white,fontSize:18 ),),
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller){
          name.value=name.value.copyWith(text: controller.userModel[0].name);
          email.value=name.value.copyWith(text: controller.userModel[0].email);
          phone.value=name.value.copyWith(text: controller.userModel[0].phone);
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
                  child: Text('Username',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                  child: TextFormField(
                    enabled: false,
                    controller: name,
                    style: const TextStyle(color: Colors.white),
                    decoration:  const InputDecoration(
                      hintText: 'name',
                      hintStyle:  TextStyle(
                          color: Colors.white,
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
                  padding:  EdgeInsets.only(left: 30.0,right: 30),
                  child:  Divider(color: Color(0xdd212121),thickness: 3,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                  child: Text('Email',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                  child: TextFormField(
                    enabled: false,
                    controller: email,
                    style: const TextStyle(color: Colors.white),
                    decoration:const  InputDecoration(

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
                  padding:  EdgeInsets.only(left: 30.0,right: 30),
                  child:  Divider(color: Color(0xdd212121),thickness: 3,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                  child: Text('phone',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                  child: TextFormField(
                    enabled: false,
                    controller: phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintStyle:  TextStyle(
                          color: Colors.white,
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
                  padding:  EdgeInsets.only(left: 30.0,right: 30),
                  child:  Divider(color: Color(0xdd212121),thickness: 3,),
                ),

              ],
            ),
          );
        }
      ),
    );
  }
}
