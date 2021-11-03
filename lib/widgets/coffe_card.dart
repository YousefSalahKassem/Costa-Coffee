import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/pages/details_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:page_transition/page_transition.dart';


class CoffeeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller)=> Container(
        height: 300,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.mostSellingModel.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){Navigator.pushReplacement(context, PageTransition(child: CoffeeDetailsPage(mostSellingModel: controller.mostSellingModel[index]), type: PageTransitionType.leftToRight));},
                child: Row(
                  children: [
                    Container(
                      height: 250,
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
                                    image: CachedNetworkImageProvider(controller.mostSellingModel[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.mostSellingModel[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  controller.mostSellingModel[index].description,
                                  style: const TextStyle(
                                      color: Color(0xff919293), fontSize: 11),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "${controller.mostSellingModel[index].size[0]['price']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF6F2A3B),
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ))
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
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}