import 'package:costacoffe/model/address_model.dart';
import 'package:costacoffe/pages/myaddresses.dart';
import 'package:costacoffe/view_model/address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Add Addresses',style: TextStyle(color: Colors.white,fontSize:18 ),),
        leading:  IconButton(onPressed: (){Navigator.pushReplacement(context, PageTransition(child:  MyAddresses(), type: PageTransitionType.rightToLeft));}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: GetBuilder<AddressViewModel>(
        init: Get.find<AddressViewModel>(),
        builder:(controller)=> SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/Delivery address-bro.svg',height: 250,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('Street 1',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.street1=value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration:  const InputDecoration(
                        hintText: 'Street 1',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('Street 2',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.street2=value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration:const  InputDecoration(
                        hintText: 'Street 2',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('State',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.state=value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'State',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('City',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.city=value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'City',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 20),
                    child: Text('Country',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30.0,right: 30.0,top: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.country=value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Country',
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),
                        fillColor: Colors.black,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF474747))
                        ),
                      ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: GetBuilder<AddressViewModel>(
            init: Get.find<AddressViewModel>(),
            builder:(controller)=> Padding(
            padding: const EdgeInsets.only(left: 45.0,right: 45,bottom: 10,top: 35),
            child: BottomAppBar(color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  controller.addtoaddresslist(AddressInfo(street1: controller.street1, street2: controller.street2, state: controller.state, city: controller.city, country: controller.country, map: ''));
                  Navigator.pushReplacement(context, PageTransition(child:  MyAddresses(), type: PageTransitionType.rightToLeft));
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(color: Color(0xFF6F2A3B),borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),),
              ),),
          ),
        ),
      ),
    );
  }
}
