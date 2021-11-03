import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/pages/details_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SpecialCoffeeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder:(controller)=> Container(
        height: 200.h,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.specialModel.length,
            itemBuilder: (context, index){
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: CoffeeDetailsPage(mostSellingModel: controller.specialModel[index],), type: PageTransitionType.leftToRight  ));
                    },
                    child: Container(
                      height: 140.h,
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
                                        controller.specialModel[index].image),
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
                                controller.specialModel[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                controller.specialModel[index].description,
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
                                            "${controller.specialModel[index].size[0]['price']}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 4,),
                                      Row(
                                        children: [
                                          const Text(
                                            r'$ ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                decorationColor: Colors.red,
                                                decorationStyle: TextDecorationStyle.solid,
                                                decoration:
                                                TextDecoration.lineThrough,
                                                fontSize: 14),
                                          ),
                                           Text(
                                            "${controller.specialModel[index].size[0]['hiddenPrice']}",
                                            style: const TextStyle(
                                                decorationColor: Colors.red,
                                                decorationStyle: TextDecorationStyle.solid,
                                                decoration:
                                                TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 14,
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
              );
            }),
      ),
    );
  }
}