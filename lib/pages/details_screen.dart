import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:costacoffe/model/cart_model.dart';
import 'package:costacoffe/model/most_selling_model.dart';
import 'package:costacoffe/pages/home_screen.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'control_screen.dart';

class CoffeeDetailsPage extends StatefulWidget {

  MostSellingModel mostSellingModel;


  CoffeeDetailsPage({required this.mostSellingModel});

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  int selected=0;

  @override
  void initState() {
    // TODO: implement initState
    selected=0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 440,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image:  DecorationImage(
                            image: NetworkImage(
                                widget.mostSellingModel.image),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 320,
                    child: BlurryContainer(
                      padding: const EdgeInsets.all(20),
                      height: 140,
                      bgColor:const Color(0xff141921),
                      width: MediaQuery.of(context).size.width,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                widget.mostSellingModel.name,
                                style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.mostSellingModel.description,
                                style: const TextStyle(
                                  color: Color(0xff919296),
                                  fontSize: 12,
                                ),
                              ),
                            const  SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "images/star.svg",
                                    height: 20,
                                    color: Color(0xFF6F2A3B),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                   Text(
                                    widget.mostSellingModel.rate,
                                    style:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "images/coffee-beans.svg",
                                          color: Color(0xFF6F2A3B),
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Coffee",
                                          style: TextStyle(
                                              color: Color(0xff919296),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color:const Color(0xff101419),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 42,
                                    width: 42,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "images/water-drop.svg",
                                          color:const Color(0xFF6F2A3B),
                                          height: 15,
                                        ),
                                        const  SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Milk",
                                          style: TextStyle(
                                              color: Color(0xff919296),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color:const Color(0xff101419),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ],
                              ),
                              const  SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 37,
                                width: 120,
                                child: Center(
                                    child: Text(
                                      widget.mostSellingModel.roastedType,
                                      style: const TextStyle(
                                          color: Color(0xff919296),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                                decoration: BoxDecoration(
                                    color:const Color(0xff101419),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(left: 20,top: 50,child: InkWell(child: const Icon(Icons.arrow_back_ios,color: Colors.white,),onTap: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));},)),

                ],
              ),
              const  SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                          color: Color(0xff919296),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                      Text(
                      widget.mostSellingModel.details,
                      style: const TextStyle(color: Color(0xff919296), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(
                          color: Color(0xff919296),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const  SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  selected=index;
                                });
                              },
                              child: Container(

                                height: 37,
                                width: 110,
                                decoration: BoxDecoration(
                                    color:selected==index?const Color(0xFF6F2A3B):Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Color(0xFF6F2A3B))),
                                child: Center(
                                    child: Text(
                                      widget.mostSellingModel.size[index]['size'],
                                      style: const TextStyle(
                                        color: Color(0xff919296),
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                            ),
                          );
                        } ,
                        itemCount: widget.mostSellingModel.size.length,
                      ),
                    ),
                    const  SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  color: Color(0xff919296),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  r'$',
                                  style: TextStyle(
                                      color: Color(0xFF6F2A3B), fontSize: 21),
                                ),
                                Text(' '+
                                  widget.mostSellingModel.size[selected]['price'],
                                  style:const TextStyle(
                                      color: Colors.white, fontSize: 21),
                                )
                              ],
                            )
                          ],
                        ),
                        // ignore: deprecated_member_use
                        GetBuilder<CartViewModel>(
                          init: Get.find<CartViewModel>(),
                          builder:(controller)=> ButtonTheme(
                            minWidth: 200,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                controller.addProduct(CartModel(name: widget.mostSellingModel.name, image: widget.mostSellingModel.image, price: widget.mostSellingModel.size[selected]['price'], quantity: 1,id: widget.mostSellingModel.id,size: widget.mostSellingModel.size[selected]['size'],details: widget.mostSellingModel.details));
                                Navigator.pushReplacement(context, PageTransition(child: ControlScreen(), type: PageTransitionType.leftToRight));
                              },
                              color: const Color(0xFF6F2A3B),
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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