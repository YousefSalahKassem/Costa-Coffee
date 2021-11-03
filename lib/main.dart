import 'package:costacoffe/pages/splash_screen.dart';
import 'package:costacoffe/view_model/cart_view_model.dart';
import 'package:costacoffe/view_model/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'helper/Binding.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeViewModel());
  Get.put(CartViewModel());
  runApp( MyApp());
}

class MyApp extends StatefulWidget {



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      builder:()=> GetMaterialApp(
        initialBinding: Binding(),
        title: 'Costa Coffee',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen()
      ),
      designSize: const Size(360, 640),
    );
  }
}

