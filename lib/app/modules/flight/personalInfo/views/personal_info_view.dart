import 'package:flightbooking/app/commonWidgtes/commonTextField.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            backarrow,
            width: 20,
            height: 20,
          ).onTap(() {
            Get.back();
          }),
        ),
        title: Text(
          'Personal Info',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
            child: ListView(
          children: [
            20.heightBox,
            CircleAvatar(
              radius: 35.r,
              child:  Image.asset(profilepicture,),
              
            ),
            10.heightBox,
            Center(
              child: Text(
                'Hello Traveler',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                  ),
                  10.heightBox,
                  commonTextField(
                      icon: nameicon,
                      hinttext: "Enter your name here",
                      textEditingController: controller.nameController.value),
                  20.heightBox,
                  const Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                  ),
                  10.heightBox,
                  commonTextField(
                      icon: address,
                      hinttext: "Enter your address",
                      textEditingController: controller.nameController.value),
                  20.heightBox,
                  const Text(
                    "Passport",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                  ),
                  10.heightBox,
                  commonTextField(
                      icon: passport,
                      hinttext: "ED 543535435",
                      textEditingController: controller.nameController.value),
                  20.heightBox,
                  const Text(
                    "DOB",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                  ),
                  10.heightBox,
                  commonTextField(
                      icon: dob,
                      hinttext: "12/12/2024",
                      textEditingController: controller.dobController.value),
                  20.heightBox,
                  const Text(
                    "Country",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                  ),
                  10.heightBox,
                  commonTextField(
                      icon: globe,
                      hinttext: "Country",
                      textEditingController: controller.nameController.value),
                  20.heightBox,
                  CustomButton(
                      buttonName: "Confirm",
                      onPressed: () {},
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: primaycolor,
                      rounded: false,
                      height: 40.h,
                      textSize: 14.sp,
                      width: double.infinity),
                    20.heightBox,
                    Center(
                      child: TextButton(onPressed: (){}, child: Text("Skip",style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: primaycolor
                      ),)),
                    )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
