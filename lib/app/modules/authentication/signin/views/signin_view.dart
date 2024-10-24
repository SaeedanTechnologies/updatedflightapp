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

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
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
              20.heightBox,
              const Center(
                child: Text(
                  "Welcome back",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: blackcolor),
                ),
              ),
              10.heightBox,
              const Center(
                child: Text(
                  "Login to your account",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
                    20.heightBox,
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: password,
                        hinttext: "********",
                        textEditingController:
                            controller.passwordController.value),
                    Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              Checkbox(
                                checkColor: blackcolor,
                                side: const BorderSide(color: greyColor),
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    // Set the fill color of the checkbox when it is selected (checked)
                                    return halfwhitecolor; // Change the color to your preferred color
                                  }
                                  // Set the fill color of the checkbox when it is not selected (unchecked)
                                  return Colors
                                      .transparent; // Change the color to your preferred color
                                }),
                                value: controller.accepttermsandConditions.value
                                    ? true
                                    : false,
                                onChanged: (bool? value) {
                                  controller.accepttermsandConditions.value =
                                      !controller
                                          .accepttermsandConditions.value;
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            "Forgot Password ? ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                                color: primaycolor),
                          ),
                        )
                      ],
                    ),
                    30.heightBox,
                    CustomButton(
                        buttonName: "SignIn",
                        onPressed: () {
                          if (controller
                                  .emailController.value.text.isNotEmpty &&
                              controller
                                  .passwordController.value.text.isNotEmpty) {
                                    controller.signIn();
                                  }
                        },
                        textcolor: whitecolor,
                        loading: false,
                        backgroundColor: primaycolor,
                        rounded: false,
                        height: 40.h,
                        textSize: 15.sp,
                        width: double.infinity),
                    30.heightBox,
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP);
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
