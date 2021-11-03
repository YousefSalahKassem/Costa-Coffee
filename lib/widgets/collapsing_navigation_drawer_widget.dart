import 'package:costacoffe/constant/theme.dart';
import 'package:costacoffe/model/navigation_model.dart';
import 'package:costacoffe/pages/cart_screen.dart';
import 'package:costacoffe/pages/login_screen.dart';
import 'package:costacoffe/pages/myaddresses.dart';
import 'package:costacoffe/pages/orders_screen.dart';
import 'package:costacoffe/pages/person_profile_screen.dart';
import 'package:costacoffe/pages/voucher_screen.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'collapsing_list_tile_widget.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 10;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
    currentSelectedIndex = 10;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }
  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: GetBuilder<HomeViewModel>(
          init: Get.find<HomeViewModel>(),
          builder:(controller)=> Column(
            children: <Widget>[
              CollapsingListTile(title: FirebaseAuth.instance.currentUser!.displayName.toString().substring(0,10), icon: Icons.person, animationController: _animationController, onTap: (){},),
              const Divider(color: Colors.grey, height: 40.0,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(height: 12.0);
                  },
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                          if(currentSelectedIndex==0){
                            Navigator.pushReplacement(context, PageTransition(child:const PersonProfileScreen(), type: PageTransitionType.rightToLeft));
                          }
                          else if(currentSelectedIndex==1){
                            Navigator.pushReplacement(context, PageTransition(child:  MyAddresses(), type: PageTransitionType.rightToLeft));
                          }
                          else if(currentSelectedIndex==2){
                            Navigator.pushReplacement(context, PageTransition(child: const VoucherScreen(), type: PageTransitionType.rightToLeft));
                          }
                          else if(currentSelectedIndex==3){
                            Navigator.pushReplacement(context, PageTransition(child: const OrderScreen(), type: PageTransitionType.rightToLeft));
                          }
                          else if (currentSelectedIndex==4){
                            Navigator.pushReplacement(context, PageTransition(child: const CartScreen(), type: PageTransitionType.rightToLeft));
                          }
                          else if(currentSelectedIndex==5){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                backgroundColor: const Color(0xFF6F2A3B),
                                title: Row(
                                  children: [
                                    Image.asset('images/costa.png',height: 30,width: 30,),
                                    const SizedBox(width: 15,),
                                    const Text('Costa Coffee',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                content: const Text('Are you sure you want to Sign Out ?',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                actions: [
                                  MaterialButton(child: const Text('No',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }),
                                  MaterialButton(color: Colors.red,child:const Text('Yes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                      onPressed: (){
                                        FirebaseAuth.instance.signOut().whenComplete(() => Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.leftToRight)));
                                      }),
                                ],
                              );
                            });
                          }
                        });
                      },
                      isSelected: currentSelectedIndex == counter,
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController,
                    );
                  },
                  itemCount: navigationItems.length,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: _animationController,
                  color: selectedColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}