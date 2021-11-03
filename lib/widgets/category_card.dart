import 'package:cached_network_image/cached_network_image.dart';
import 'package:costacoffe/pages/category_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder:(controller)=>Container(
          height: 100.h,
          child: InkWell(
            onTap: (){},
            child: ListView.builder(
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, PageTransition(child: CategoryScreen(category: controller.categoryModel[index].name), type: PageTransitionType.rightToLeft));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image:  DecorationImage(
                                  image: CachedNetworkImageProvider(controller.categoryModel[index].image),
                                  fit: BoxFit.cover)),
                        ),
                        Center(child:Text(
                          controller.categoryModel[index].name,
                          style: const TextStyle(color: Colors.white),
                        ) ,),
                      ],
                    ),
                  ),
                );
              },
             ),
          ),
        ),
    );
  }
}
