import 'package:flightbooking/app/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget commonTextField(
    {required String icon,
    required String hinttext,
    required TextEditingController textEditingController,
    bool obscureText = false, TextInputType textInputType=TextInputType.text}) {
  return TextField(
    keyboardType:textInputType,
    obscureText: obscureText,
    controller: textEditingController,
    cursorHeight: 15.h,
    style: TextStyle(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: textfieldgrey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: textfieldgrey)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: textfieldgrey)),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: SizedBox(
          height: 20,
          width: 30,
          child: Image.asset(
            icon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
      hintText: hinttext,
      hintStyle: TextStyle(
          fontSize: 11.sp, fontWeight: FontWeight.w400, color: textfieldgrey),
    ),
  );
}
