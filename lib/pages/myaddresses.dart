
import 'package:costacoffe/model/address_model.dart';
import 'package:costacoffe/pages/add_address_screen.dart';
import 'package:costacoffe/service/addresses_database_helper.dart';
import 'package:costacoffe/view_model/address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:geolocator/geolocator.dart';

import 'control_screen.dart';

class MyAddresses extends StatefulWidget {

  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {

  String location='null';
  String Address='';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddress(Position position)async{
    List<Placemark> placeMark=await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place=placeMark[0];
    Address='${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country},';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Addresses',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
       leading: IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child: const ControlScreen(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      bottomNavigationBar: GetBuilder<AddressViewModel>(
        init: Get.find<AddressViewModel>(),
        builder:(controller)=> BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color:Color(0xFF6F2A3B),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              InkWell(
                  onTap: ()async{
                    Position position=await _determinePosition();
                    GetAddress(position);
                    setState(() {
                    });
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
                        content:  Text('Location:\n'+Address,style:const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        actions: [
                          MaterialButton(child: const Text('No',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                              onPressed: (){
                                Navigator.pop(context);
                              }),
                          MaterialButton(color: Colors.red,child:const Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              onPressed: (){
                                controller.addtoaddresslist(AddressInfo(street1: ' ', street2: '', state: '', city: '', country: '', map: Address));
                                Navigator.pop(context);
                              }),
                        ],
                      );
                    });
                  },
                  child: Container(height: 50,width: 100,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),child: Center(child: Text('Map',style: TextStyle(color:Color(0xFF6F2A3B),fontWeight: FontWeight.bold,fontSize: 16 ),)),)),
              InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child:const AddAddressScreen(), type: PageTransitionType.rightToLeft));
              }
              ,child: Container(height: 50,width: 100,decoration:const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),child: Center(child: Text('Add',style: TextStyle(color:Color(0xFF6F2A3B),fontWeight: FontWeight.bold,fontSize: 16 ),)),))
              ],),
          ),
        ),
      ),
      body: GetBuilder<AddressViewModel>(
        init: Get.find<AddressViewModel>(),
        builder: (controller)=>ListView.separated(
          itemBuilder: (context, index) {
            print(controller.addressInfo[0].state);
            return Dismissible(
                background: Container(width: MediaQuery.of(context).size.width,
                color: Colors.red,),
                onDismissed: (direction){
                  
                  addressDatabaseHelper.db.deleteproduct(controller.addressInfo[index].street1);
                  controller.addressInfo.removeAt(index);
                },
                key: UniqueKey(), child:
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              height: 140,
              child:  Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Home Address',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),

                    ),
                    const SizedBox(
                      height: 6,
                    ),

                     Container(
                      width: 350,
                      child: Text(
                        controller.addressInfo[index].map+','+controller.addressInfo[index].street1+' , '+controller.addressInfo[index].street2+' , '+controller.addressInfo[index].state+' , '+controller.addressInfo[index].country+' , '+controller.addressInfo[index].city,
                        style:const TextStyle(color: Colors.white,
                          fontSize: 15,),
                        maxLines: 5,
                      )
                    ),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding:  EdgeInsets.only(right: 30.0),
                      child:  Divider(color: Colors.grey,thickness: .5,),
                    ),
                  ],
                ),
              ),
            ));

          },

          itemCount: controller.addressInfo.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
