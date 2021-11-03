import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/pages/checkout_screen.dart';
import 'package:costacoffe/service/cart_database_helper.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:page_transition/page_transition.dart';

import 'control_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder:(controller)=> Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cart',style: TextStyle(fontSize: 25),),backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){controller.deleteproduct();
            controller.cartProductModel.length=0;},
                icon: const Icon(FontAwesomeIcons.trashAlt,color:Color(0xFF6F2A3B) ,))
          ],
          leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        bottomNavigationBar:controller.cartProductModel.length!=0? BottomAppBar(
          color: Colors.transparent,
           child:    GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),
            builder:(controller){
              return Container(
                height: MediaQuery.of(context).size.height*.35,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color:Color(0xFF6F2A3B),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('SubTotal',style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text('\$${controller.totalprice.toStringAsFixed(2)}',style: TextStyle(color: Colors.white,fontSize: 16),),
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0,left: 25),
                      child: Divider(color: Colors.grey.shade500,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Text('Tas & Fee',style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text('\$3.50',style: TextStyle(color: Colors.white,fontSize: 16),),
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0,left: 25),
                      child: Divider(color: Colors.grey.shade500,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Text('Delivery',style: TextStyle(color: Colors.white,fontSize: 16),),
                          Text('\$10.10',style: TextStyle(color: Colors.white,fontSize: 16),),
                        ],),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(right: 25.0,left: 25),
                      child: Divider(color: Colors.white,thickness: 2,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text('Total',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('\$${(controller.totalprice+3.50+10.10).toStringAsFixed(2)}',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0,left: 25,top: 25),
                      child: InkWell(
                          onTap: (){Navigator.pushReplacement(context, PageTransition(child:const CheckOutScreen(), type: PageTransitionType.rightToLeft));},
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),width: MediaQuery.of(context).size.width,height: 50,child: Center(child: const Text('Checkout',style: TextStyle(color: Color(0xFF6F2A3B),fontSize: 20),)),)),
                    )
                  ],),
              );
            }

          ),
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('images/carto.svg',width: 200,height: 200),
           const SizedBox(height: 10,),
           const Center(child: Text( 'Cart Empty',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500,)))
          ],
        ),
        body:GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) =>
          ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(controller.cartProductModel[index].image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.cartProductModel[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 50,
                                  width: 200,
                                  child: Text(
                                    controller.cartProductModel[index].details,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      height: 1
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              r'$ ',
                                              style: TextStyle(
                                                  color: Color(0xFF6F2A3B),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              "${controller.cartProductModel[index].price}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            controller.decreaseQuntity(index);
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color:const Color(0xff919296),
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child: const Padding(
                                                padding:  EdgeInsets.only(bottom: 15.0),
                                                child:   Icon(
                                                  Icons.minimize,
                                                  color: Color(0xFF6F2A3B),
                                                  size: 20,
                                                ),
                                              )),
                                        ),
                                        Container(
                                            height: 30,
                                            width: 30,

                                            child: Center(child: Text(controller.cartProductModel[index].quantity.toString(),style:const TextStyle(fontSize: 20,color: Colors.white) ,))),
                                        InkWell(
                                          onTap: () {
                                            controller.increaseQuntity(index);
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color:const Color(0xFF6F2A3B),
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child:const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xff141921),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              );
            },
            itemCount: controller.cartProductModel.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15,
              );
            },
          )))
    );
  }
}
