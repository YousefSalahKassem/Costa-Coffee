import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'control_screen.dart';
import 'details_screen.dart';

class CategoryScreen extends StatefulWidget {

  String category='';


  CategoryScreen({required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        title:  Text(widget.category,style:const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder:(controller)=> Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Find the best\ncoffee for you",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
             const  SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.productModel.length,
                  itemBuilder: (context, index){
                    controller.Category=widget.category;
                    return controller.Category==controller.productModel[index].category? Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context, PageTransition(child: CoffeeDetailsPage(mostSellingModel: controller.productModel[index],), type: PageTransitionType.leftToRight));
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
                                          image: CachedNetworkImageProvider(
                                              controller.productModel[index].image),
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
                                      controller.productModel[index].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      controller.productModel[index].description,
                                      style:const TextStyle(
                                          color: Color(0xff919293), fontSize: 12),
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
                                                  "${controller.productModel[index].size[0]['price']}",
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
                                        Column(
                                          children: [
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF6F2A3B),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child:const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20,
                                                )),
                                            const SizedBox(height: 8,)
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
                    ): Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
