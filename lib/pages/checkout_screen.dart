import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costacoffe/model/order_model.dart';
import 'package:costacoffe/pages/cart_screen.dart';
import 'package:costacoffe/pages/control_screen.dart';
import 'package:costacoffe/view_model/address_view_model.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selected=0;
  bool show=false;
   String percent = '0';
   String offer='';
  TextEditingController coupon=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    selected=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const CartScreen(), type: PageTransitionType.rightToLeft));}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
      body: SingleChildScrollView(
        child: Column(children: [
          GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),builder: (controller){
              int items=0;
              for(int i=0;i<controller.cartProductModel.length;i++){
                items+=(controller.cartProductModel[i].quantity);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(items.toString()+'  items Added in your Cart',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.cartProductModel.length,
                        itemBuilder: (context,index){
                        return  Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 270,
                                  width: 160,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 135,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(controller.cartProductModel[index].image),
                                                fit: BoxFit.cover)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.cartProductModel[index].name,
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,

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
                                            ),
                                            const SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                SizedBox(
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
                                      )

                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff242931),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text('Delivery Address',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
                  ),
                  GetBuilder<AddressViewModel>(
                    init: Get.find<AddressViewModel>(),
                    builder:(control)=> Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child:ListView.builder(scrollDirection: Axis.horizontal,itemCount: control.addressInfo.length,itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                selected=index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:const Color(0xff141921),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: 200,
                              width: MediaQuery.of(context).size.width*.8,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      control.addressInfo[index].map!=''?control.addressInfo[index].map:
                                      control.addressInfo[index].street1+' , '+control.addressInfo[index].street2+' , '+control.addressInfo[index].state+' , '+control.addressInfo[index].country+' , '+control.addressInfo[index].city,style:const TextStyle(color: Colors.white,fontSize: 22),maxLines: 4,),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: GetBuilder<HomeViewModel>(
                                      init: Get.find<HomeViewModel>(),
                                      builder:(controll)=> Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Mobile Number:  '+controll.userModel[0].phone,style: TextStyle(color: Colors.white,fontSize: 16),maxLines: 4,),
                                           selected==index?CircleAvatar(backgroundColor: Colors.red,radius: 15,child: Icon(Icons.check,color: Colors.white,)):Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                      }) ,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text('Coupon',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
                  ),
                  GetBuilder<HomeViewModel>(
                    init: Get.find<HomeViewModel>(),
                    builder:(controller)=> Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.local_offer,color: Colors.white,),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width*.6,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 1.0,right: 1.0),
                                  child: TextFormField(
                                    controller: coupon,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Voucher Code',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      fillColor: Colors.black,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color:Colors.transparent)
                                      ),
                                      focusedBorder:
                                      UnderlineInputBorder(
                                          borderSide: BorderSide(color:Colors.transparent)
                                      ),
                                    ),),
                                ),
                              ),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      for (int i = 0;
                                      i < controller.vouchers.length;
                                      i++) {
                                        if (coupon.text.toString() ==
                                            controller.vouchers[i].code&&(controller.vouchers[i].userId==FirebaseAuth.instance.currentUser!.uid||controller.vouchers[i].userId=='All')) {
                                          int ind = i;
                                          percent =
                                              controller.vouchers[ind].percentage;
                                          offer=controller.vouchers[ind].offer;
                                          show = !show;
                                          Get.snackbar(
                                              'Successfully process',
                                              'your offer are added in your order with ' +
                                                  percent +
                                                  '% discount on your order!',
                                              snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
                                        }
                                      }
                                    });
                                  },
                                  child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.4,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<HomeViewModel>(
                      init: Get.find<HomeViewModel>(),
                      builder:(con)=> Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('SubTotal',style: TextStyle(color: Colors.white,fontSize: 16),),
                                Text('\$${controller.totalprice.toStringAsFixed(2)}',style:const TextStyle(color: Colors.white,fontSize: 16),),
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
                          Column(
                            children: [
                              show==true?Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
                                child: Column(
                                  children: [
                                    Divider(color: Colors.grey.shade500,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Discount',style: TextStyle(color: Colors.white,fontSize: 16),),
                                        Text('${percent} %',style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],),
                                  ],
                                ),
                              ):Container()
                            ],
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
                                Text('\$${((controller.totalprice+3.50+10.10)-(controller.totalprice+3.50+10.10)* (int.parse(percent) / 100)).toStringAsFixed(2)}',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ],),
                          ),
                          GetBuilder<AddressViewModel>(
                            init: Get.find<AddressViewModel>(),
                            builder:(control)=> Padding(
                              padding: const EdgeInsets.only(right: 25.0,left: 25,top: 25),
                              child: InkWell(
                                  onTap: (){
                                    if(con.userModel[0].phone=='null'){
                                      Get.snackbar('Warning !', 'you need to fill the phone number in settings !',colorText: Colors.white,snackPosition: SnackPosition.BOTTOM);
                                    }
                                    else{
                                    FirebaseFirestore.instance.collection('Orders').doc().set(
                                      OrderModel(userId: FirebaseAuth.instance.currentUser!.uid, dateTime: DateFormat.yMMMd().format(DateTime.now()).toString(), street1: control.addressInfo[selected].street1, street2: control.addressInfo[selected].street2, state: control.addressInfo[selected].state, city: control.addressInfo[selected].city, country: control.addressInfo[selected].country, products: controller.cartProductModel.toList(), phone: con.userModel[0].phone,map:control.addressInfo[selected].map,status: 'Order Processing',offer:offer,total:((controller.totalprice+3.50+10.10)-(controller.totalprice+3.50+10.10)* (int.parse(percent) / 100)).toString()).toMap());
                                    controller.deleteproduct();
                                    controller.cartProductModel.length = 0;
                                    Get.offAll(const ControlScreen());
                                    }
                                  },
                                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFF6F2A3B)),width: MediaQuery.of(context).size.width,height: 50,child: Center(child: const Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 20),)),)),
                            ),
                          )
                        ],),
                    ),
                  ),
                ],
              );
          }),

        ],),
      ),
    );
  }
}
