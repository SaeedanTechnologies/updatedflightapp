import 'package:flightbooking/app/commonWidgtes/commonTextField.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/models/sendRequestModels/requestUserRegister.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: ListView(
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
                  "Register",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: blackcolor),
                ),
              ),
              10.heightBox,
              const Center(
                child: Text(
                  "Create your new account",
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
                      "First Name",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: profileicon,
                        hinttext: "Abdul",
                        textEditingController:
                            controller.firstnameController.value),
                    20.heightBox,
                    const Text(
                      "Last Name",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: profileicon,
                        hinttext: "Salam",
                        textEditingController:
                            controller.lastnameController.value),
                    20.heightBox,
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: emailicon,
                        hinttext: "Email",
                        textEditingController:
                            controller.emailController.value),
                    20.heightBox,
                    const Text(
                      "Phone",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        textInputType: TextInputType.number,
                        icon: call,
                        hinttext: "Phone",
                        textEditingController:
                            controller.phonenumberController.value),
                    20.heightBox,
                    const Text(
                      "City",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                    ),
                    10.heightBox,
                    commonTextField(
                        icon: call,
                        hinttext: "City name",
                        textEditingController: controller.cityController.value),
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
                        icon: lock,
                        hinttext: "**********",
                        textEditingController:
                            controller.passwordController.value),
                    20.heightBox,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "By signing up you agree to our ",
                          style: TextStyle(
                              color: textfieldgrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp)),
                      TextSpan(
                        text: "Terms & Conditions ",
                        style: TextStyle(
                            color: primaycolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      TextSpan(
                        text: "and ",
                        style: TextStyle(
                            color: textfieldgrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: TextStyle(
                            color: primaycolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ])),
                    30.heightBox,
                    Obx(
                      () => CustomButton(
                          buttonName: "Signup",
                          onPressed: () async {
                            RequestUserRegister requestUserRegister =
                                RequestUserRegister(
                                    userInfoFirstname: controller
                                        .firstnameController.value.text
                                        .toString(),
                                    userInfoLastname: controller
                                        .lastnameController.value.text
                                        .toString(),
                                    email: controller.emailController.value.text
                                        .toString(),
                                    city: '8879',
                                    mobile: controller
                                        .phonenumberController.value.text
                                        .toString(),
                                    password: controller
                                        .passwordController.value.text
                                        .toString(),
                                    address: "tehran",
                                    code_meli: "12365",
                                    personalPhoto: '20220515/de56335433a6bc25');
                      
                            controller.registerUser(requestUserRegister.toJson());
                          },
                          textcolor: whitecolor,
                          loading: controller.isLoading.value,
                          backgroundColor: primaycolor,
                          rounded: false,
                          height: 40.h,
                          textSize: 15.sp,
                          width: double.infinity),
                    ),
                    30.heightBox,
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Have an Account?",
                              style: TextStyle(
                                  color: textfieldgrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp)),
                          TextSpan(
                            text: " SignIn.",
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
