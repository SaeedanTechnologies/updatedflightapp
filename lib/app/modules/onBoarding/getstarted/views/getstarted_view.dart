import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/getstarted_controller.dart';

class GetstartedView extends GetView<GetstartedController> {
  const GetstartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                splashScreen,
              ),
              colorFilter: ColorFilter.mode(
                  blackcolor.withOpacity(0.5), BlendMode.darken))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                30.heightBox,
                Image.asset(whitelogo),
                10.heightBox,
                const Text(
                  "Alahudein",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: whitecolor),
                ),
                const Spacer(),
                const Text(
                  "Get Your Favourite Flight & Hotel",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: whitecolor),
                ),
                20.heightBox,
                const Text(
                  "Lorem ipsum dolor sit amet cosectetur Lorem ipsum dolor sit amet cosectetur Lorem ipsum dolor sit amet cosectetur Lorem ipsum dolor sit amet cosectetur Lorem ipsum dolor sit amet cosectetur",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: whitecolor),
                ),
                50.heightBox,
                CustomButton(
                    buttonName: "Get Started",
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: primaycolor,
                    rounded: false,
                    height: 40.h,
                    textSize: 14.sp,
                    width: double.infinity),
                50.heightBox
              ],
            ),
          )),
        ),
      ),
    );
  }
}
