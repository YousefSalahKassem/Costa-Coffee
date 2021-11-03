import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/model/order_model.dart';
import 'package:costacoffe/pages/orders_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class OrderDetails extends StatefulWidget {
late OrderModels orderModels;

OrderDetails({required this.orderModels});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        title:const Text('Order Details',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const OrderScreen(), type: PageTransitionType.leftToRight));}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      widget.orderModels.status=='Order Processing'||widget.orderModels.status=='Canceled'?Text(widget.orderModels.status,style:const TextStyle(color: Colors.red,fontSize: 14),):
                      widget.orderModels.status=='On your way'?Text(widget.orderModels.status,style:const TextStyle(color: Colors.orangeAccent,fontSize: 14),):
                      Text(widget.orderModels.status,style:const TextStyle(color: Colors.green,fontSize: 14),),
                      const SizedBox(height: 15,),
                      Text(widget.orderModels.dateTime,style: TextStyle(color: Colors.grey,fontSize: 16),),
                      Text('Phone Number: '+widget.orderModels.phone,style: TextStyle(color: Colors.grey,fontSize: 16),),
                      const SizedBox(height: 15,),



                    ],),
                )
              ],
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 15.0,right: 15),
              child:  Divider(color: Colors.grey,thickness: .5,),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.location_on,color: Colors.white,size: 35,),
                ),
                const SizedBox(width: 15,),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Delivery address',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                      const SizedBox(height: 15,),
                      widget.orderModels.map==''?
                          Container(width: 200,child: Text(widget.orderModels.street1+' , '+widget.orderModels.street2+' , '+widget.orderModels.state+' , '+widget.orderModels.country+' , '+widget.orderModels.city,style:const TextStyle(color: Colors.grey,fontSize: 14),))
                          :Container(width: 200,child: Text(widget.orderModels.map,style:const TextStyle(color: Colors.grey,fontSize: 14),)),
                      const SizedBox(height: 15,),
                    ],),
                )
              ],
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 15.0,right: 15),
              child:  Divider(color: Colors.grey,thickness: .5,),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding:  EdgeInsets.all(20.0),
              child:  Text('Order summary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(scrollDirection: Axis.vertical,itemCount: widget.orderModels.products.length,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(imageUrl: widget.orderModels.products[index]['image'],width: 100,height: 100,fit: BoxFit.cover,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                        Text(widget.orderModels.products[index]['quantity'].toString()+' X     '+widget.orderModels.products[index]['name'],style: TextStyle(color: Colors.grey,fontSize: 16),),
                        Container(width: 200,child: Text(widget.orderModels.products[index]['details'],style: TextStyle(color: Colors.grey,fontSize: 14),)),
                      ],),
                      SizedBox(width: 20,),
                      Center(child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text('\$'+widget.orderModels.products[index]['price'],style: TextStyle(color: Colors.grey,fontSize: 20),),
                      )),
                    ],
                  ),
                );
              }),
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
            Padding(
              padding: const EdgeInsets.only(right: 25.0,left: 25),
              child: Divider(color: Colors.grey.shade500,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',style: TextStyle(color: Colors.white,fontSize: 16),),
                  Text('\$'+widget.orderModels.total,style:const TextStyle(color: Colors.white,fontSize: 16),),
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
                  Text('Payment Method',style: TextStyle(color: Colors.white,fontSize: 16),),
                  Text('Cash',style: TextStyle(color: Colors.white,fontSize: 16),),
                ],),
            ),
            const SizedBox(height: 25,),
          ],
        ),
      ) ,

    );
  }
}
