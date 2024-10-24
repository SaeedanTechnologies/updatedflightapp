import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);
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
            'Search Result',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Image.asset(
                        "assets/icons/indigo.png",
                        width: 150,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "01 hr 40min",
                        style: TextStyle(
                            color: textfieldgrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          Text(
                            "5.50",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: blackcolor),
                          ),
                          Text(
                            "DEL (Delhi)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp,
                                color: textfieldgrey),
                          )
                        ],
                      ),
                      Image.asset(
                        flighticon,
                        width: 130,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: crossend,
                        children: [
                          Text(
                            "5.50",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: blackcolor),
                          ),
                          Text(
                            "CCU (Kolkota)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp,
                                color: textfieldgrey),
                          )
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            chair,
                            width: 30,
                            height: 30,
                          ),
                          10.widthBox,
                          Text(
                            "Business Class",
                            style: TextStyle(
                                color: const Color(0xff555555),
                                fontSize: 13.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "From",
                            style: TextStyle(
                                color: const Color(0xff555555),
                                fontSize: 15.sp),
                          ),
                          5.widthBox,
                          Text(
                            "\$230",
                            style: TextStyle(
                                color: const Color(0xff555555),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  30.heightBox,
                  CustomButton(
                      buttonName: "Check",
                      onPressed: () {},
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: primaycolor,
                      rounded: false,
                      height: 40.h,
                      textSize: 14.sp,
                      width: double.infinity)
                ],
              )
                  .box
                  .white
                  .border(color: textfieldgrey.withOpacity(0.1))
                  .outerShadowSm
                  .padding(pad20)
                  .rounded
                  .margin(const EdgeInsets.only(left: 20, right: 20, top: 10))
                  .make();
            }));
  }
}
