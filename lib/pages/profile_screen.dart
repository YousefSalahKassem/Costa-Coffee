import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/pages/cart_screen.dart';
import 'package:costacoffe/pages/forget_password.dart';
import 'package:costacoffe/pages/myaddresses.dart';
import 'package:costacoffe/pages/orders_screen.dart';
import 'package:costacoffe/pages/person_profile_screen.dart';
import 'package:costacoffe/pages/login_screen.dart';
import 'package:costacoffe/pages/voucher_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller)=> SingleChildScrollView(
          child: Column(
            children: [
                 Container(
             height: MediaQuery.of(context).size.height*.3,
             width: MediaQuery.of(context).size.width,
             color: const Color(0xFF6F2A3B),
             child: Padding(
               padding: const EdgeInsets.only(left: 25.0,top: 50),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Settings',style: TextStyle(color: Colors.white,fontSize: 30),),
                   const SizedBox(height: 45,),
                   Row(mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:[
                      Container(height: 80,width: 80,child: CircleAvatar(radius: 20,backgroundColor: Colors.transparent,backgroundImage:CachedNetworkImageProvider(controller.userModel[0].picture.toString()),)),
                     const SizedBox(width: 15,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const SizedBox(height: 10,),
                         const Text('Hello',style: TextStyle(color: Colors.grey,fontSize: 20,),),
                         Text(controller.userModel[0].name.substring(0,12),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),

                     ],),
                     const SizedBox(width: 100,),
                     CircleAvatar(radius: 20,backgroundColor: Color(0xFF5F1F2D),child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,)))
                   ],)
                 ],
               ),
             ),
           ),
                 const SizedBox(height: 13,),
                 Container(
                   height: MediaQuery.of(context).size.height*.25,
                   width: MediaQuery.of(context).size.width,
                   color: Colors.black,
                   child: Column(children: [
                     InkWell(
                       onTap: (){Navigator.pushReplacement(context, PageTransition(child:const PersonProfileScreen(), type: PageTransitionType.rightToLeft));},
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                           Text('Profile',style: TextStyle(color: Colors.white,fontSize: 18),),
                           Icon(Icons.arrow_forward_ios,color: Colors.white,),
                         ],),
                       ),
                     ),
                     const Divider(color: Color(0xdd212121),thickness: 3,),
                     InkWell(
                       onTap: (){Navigator.pushReplacement(context, PageTransition(child:  MyAddresses(), type: PageTransitionType.rightToLeft));},
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                             Text('Addresses',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Icon(Icons.arrow_forward_ios,color: Colors.white,),
                           ],),
                       ),
                     ),
                     const Divider(color: Color(0xdd212121),thickness: 3,),
                     InkWell(
                       onTap: (){
                          Navigator.of(context).push(PageTransition(child: ForgotPassword(), type: PageTransitionType.rightToLeft));
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                             Text('Change Password',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Icon(Icons.arrow_forward_ios,color: Colors.white,),
                           ],),
                       ),
                     ),
                   ],),
                 ),
                 const SizedBox(height: 10,),
                 Container(
                   height: MediaQuery.of(context).size.height*.25,
                   width: MediaQuery.of(context).size.width,
                   color: Colors.black,
                   child: Column(children: [

                     InkWell(
                       onTap: (){
                         Navigator.pushReplacement(context, PageTransition(child: const VoucherScreen(), type: PageTransitionType.rightToLeft));
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                             Text('Vouchers',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Icon(Icons.arrow_forward_ios,color: Colors.white,),
                           ],),
                       ),
                     ),
                     const Divider(color: Color(0xdd212121),thickness: 3,),
                     InkWell(
                       onTap: ()=>Navigator.pushReplacement(context, PageTransition(child: const OrderScreen(), type: PageTransitionType.rightToLeft)),
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                             Text('Order History',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Icon(Icons.arrow_forward_ios,color: Colors.white,),
                           ],),
                       ),
                     ),
                     const Divider(color: Color(0xdd212121),thickness: 3,),
                     InkWell(
                       onTap: ()=>Navigator.pushReplacement(context, PageTransition(child: const CartScreen(), type: PageTransitionType.rightToLeft)),
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const[
                             Text('My Cart',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Icon(Icons.arrow_forward_ios,color: Colors.white,),
                           ],),
                       ),
                     ),
                   ],),
                 ),
                 const SizedBox(height: 10,),
                 Container(
             height: MediaQuery.of(context).size.height*.075,
             width: MediaQuery.of(context).size.width,
             color: Colors.black,
             child: Column(children: [
               InkWell(
                 onTap: (){
                   showDialog(context: context, builder: (context){
                     return AlertDialog(
                       backgroundColor: const Color(0xFF6F2A3B),
                       title: Row(
                         children: [
                           Image.asset('images/costa.png',height: 30,width: 30,),
                           const SizedBox(width: 15,),
                           const Text('Costa Coffee',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                         ],
                       ),
                       content: const Text('Are you sure you want to Sign Out ?',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                       actions: [
                         MaterialButton(child: const Text('No',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                             onPressed: (){
                               Navigator.pop(context);
                             }),
                         MaterialButton(color: Colors.red,child:const Text('Yes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                             onPressed: (){
                               FirebaseAuth.instance.signOut().whenComplete(() => Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.leftToRight)));
                             }),
                       ],
                     );
                   });
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Center(
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: const[
                         Text('Sign Out',style: TextStyle(color: Colors.red,fontSize: 18),),
                         Icon(Icons.arrow_forward_ios,color: Colors.white,),
                       ],),
                   ),
                 ),
               ),
             ],),
           ),

            ],
    ),
        ),
      ),);
  }
}
