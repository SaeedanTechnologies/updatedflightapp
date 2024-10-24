import 'package:flightbooking/app/commonWidgtes/commonTextField.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/modules/authentication/signin/controllers/signin_controller.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPasswordView extends GetView<SigninController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: Column(
            crossAxisAlignment: crosstart,
            children: [
              20.heightBox,
              Center(
                child: Image.asset(
                  whitelogo,
                  width: 260.w,
                  height: 60.h,
                ),
              ),
              40.heightBox,
              const Center(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: blackcolor),
                ),
              ),
              10.heightBox,
              const Center(
                child: Text(
                  "Enter your email for recovering the account",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: blackcolor),
                ),
              ),
              30.heightBox,
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: profileicon,
                        hinttext: "Abdul@gmail.com",
                        textEditingController:
                            controller.emailController.value),
                    (MediaQuery.sizeOf(context).height / 6).heightBox,
                    CustomButton(
                        buttonName: "Continue",
                        onPressed: () {},
                        textcolor: whitecolor,
                        loading: false,
                        backgroundColor: primaycolor,
                        rounded: false,
                        height: 40.h,
                        textSize: 15.sp,
                        width: double.infinity),
                    40.heightBox,
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an Account?",
                              style: TextStyle(
                                  color: textfieldgrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp)),
                          TextSpan(
                            text: " Signup.",
                            style: TextStyle(
                                color: primaycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                        ])),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
