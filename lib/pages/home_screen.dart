
import 'package:costacoffe/model/most_selling_model.dart';
import 'package:costacoffe/pages/search_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:costacoffe/widgets/category_card.dart';
import 'package:costacoffe/widgets/coffe_card.dart';
import 'package:costacoffe/widgets/collapsing_navigation_drawer_widget.dart';
import 'package:costacoffe/widgets/special_coffe_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller)=> Scaffold(
        backgroundColor: Colors.black,
        drawer: CollapsingNavigationDrawer(),
        body: SafeArea(
          child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding:const EdgeInsets.all(20),
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.95.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xff1b2027),
                                borderRadius: BorderRadius.circular(10),
                              ),
                                child: InkWell(
                                  onTap: ()=>Navigator.pushReplacement(context, PageTransition(child:const SearchScreen(), type: PageTransitionType.rightToLeft))
                                  ,
                                  child: const Icon(
                                    Icons.search,
                                    color: Color(0xff4d4f52),
                                  ),
                                )),
                            CircleAvatar(radius: 20,backgroundColor: Colors.transparent,backgroundImage:FirebaseAuth.instance.currentUser!.photoURL.toString().isNotEmpty?NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString()):NetworkImage('https://firebasestorage.googleapis.com/v0/b/costacoffee-9fe9a.appspot.com/o/costa.png?alt=media&token=bce324a5-ff9e-426e-beda-ac61084310ed') )

                          ],),
                        const SizedBox(
                          height: 20,
                        ),
                         Text(
                          "Find the best\ncoffee for you",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CategoryCard(),
                        const SizedBox(
                        height: 20,
                        ),
                        const Text('Most Selling', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                        CoffeeCard(),
                        const Text(
                      "Special for you",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                        const SizedBox(height: 20,),
                        SpecialCoffeeCard(),
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

