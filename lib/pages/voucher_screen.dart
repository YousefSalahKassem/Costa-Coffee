import 'package:costacoffe/model/voucher_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ticket_material/ticket_material.dart';

import 'control_screen.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vouchers',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller)=> ListView.separated(itemCount: controller.vouchers.length,itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: TicketMaterial(height: 100, leftChild: left(context,controller.vouchers[index]), rightChild: right(context), colorBackground:const Color(0xFF6F2A3B)),
          );
        }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 15); },),
      ),
    );
  }
}

Widget left(BuildContext context,VoucherModel voucher){
  return Row(
    children:  [
    Container(
      width: 60,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF501B29),
      child: const Center(
        child: RotationTransition(
            turns: AlwaysStoppedAnimation(270 / 360),
            child: Text('Discount',style: TextStyle(color: Colors.white,fontSize: 15),maxLines: 1,),
        ),
      ),
    ),
    const SizedBox(width: 15,),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(voucher.offer,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),maxLines: 1,),
          Row(
            children: [
             const Text('Coupon:',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),maxLines: 1,),
              Text(voucher.code,style:const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 5),maxLines: 1,),
            ],
          ),
          Text(voucher.validation,style:const TextStyle(color: Colors.grey,fontSize: 12),maxLines: 1,),
      ],)
    ],
  );
}


Widget right(BuildContext context){
  return SizedBox(
    height: 50,
    width: 50,
    child: Center(child: Image.asset('images/costa.png'),),
  );
}

