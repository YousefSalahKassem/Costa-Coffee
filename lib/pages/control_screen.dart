import 'package:costacoffe/pages/cart_screen.dart';
import 'package:costacoffe/pages/profile_screen.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'home_screen.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GetBuilder<CartViewModel>(
        init: Get.find<CartViewModel>(),
        builder:(controller){
          int items=0;
          for(int i=0;i<controller.cartProductModel.length;i++){
             items+=controller.cartProductModel[i].quantity;
          }
         return BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: const Color(0xFF6F2A3B),
            unselectedItemColor: const Color(0xff4d4f52),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: ""),
              BottomNavigationBarItem(icon: Stack(children: [
              const  Icon(Icons.shopping_bag,size: 30,),
              items==0?
              Positioned(bottom: 1,left: 15,child: SizedBox(width: 15,height: 18,child: Container()))
                  :Positioned(bottom: 1,left: 15,child: SizedBox(width: 15,height: 18,child: CircleAvatar(radius: 15,backgroundColor: Colors.red,child: Center(child: Text(items.toString(),textAlign: TextAlign.center,)),)))

              ],), label: ""),
              const BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,), label: ""),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          );
        }
      ),);
  }
}
