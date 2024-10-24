import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: whitecolor,
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Image.asset(logo,width: 350.w,height: 100.h,),
        )
      ),
    );
  }
}
