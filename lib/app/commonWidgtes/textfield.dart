import 'package:flightbooking/app/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSearchTextField({String hinttext="Search for mentors", bool readOnly=false }) {
  return TextField(
    readOnly:readOnly ,
    style: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
    decoration: InputDecoration(
        focusedBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor.withOpacity(0.5), width: 2)),
        enabledBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color:greyColor.withOpacity(0.5))),
        border:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor.withOpacity(0.5))),
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
        suffixIcon: const Icon(
          Icons.search,
          color: textfieldgrey,
        )),
  );
}
