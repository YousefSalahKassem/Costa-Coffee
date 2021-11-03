import 'package:costacoffe/pages/order_details_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'control_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        title:const Text('Your Orders',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder:(controller)=>ListView.builder(
              itemCount: controller.orderModel.length,
              itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){Navigator.pushReplacement(context, PageTransition(child: OrderDetails(orderModels: controller.orderModel[index]), type: PageTransitionType.rightToLeft));},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Color(0xFF6F2A3B),
                            borderRadius:const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('images/costa.png',height: 50,width: 50,),
                            ),
                            const SizedBox(width: 15,),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Costa Coffee',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                  controller.orderModel[index].status=='Order Processing'||controller.orderModel[index].status=='Canceled'?Text(controller.orderModel[index].status,style:const TextStyle(color: Colors.red,fontSize: 14),):
                                  controller.orderModel[index].status=='On your way'?Text(controller.orderModel[index].status,style:const TextStyle(color: Colors.orangeAccent,fontSize: 14),):
                                  Text(controller.orderModel[index].status,style:const TextStyle(color: Colors.green,fontSize: 14),),
                                  const SizedBox(height: 15,),
                                  Text(controller.orderModel[index].dateTime,style: TextStyle(color: Colors.grey,fontSize: 16),),
                                  Text('Phone Number: '+controller.orderModel[index].phone,style: TextStyle(color: Colors.grey,fontSize: 16),),




                                ],),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
              }) ),
    );
  }
}
