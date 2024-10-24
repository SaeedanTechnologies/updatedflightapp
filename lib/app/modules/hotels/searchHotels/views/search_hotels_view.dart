import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/resources/physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/search_hotels_controller.dart';

class SearchHotelsView extends GetView<SearchHotelsController> {
  const SearchHotelsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    20.heightBox,
                    TextField(
                      onTap: () {},
                      readOnly: true,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5), width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5))),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5))),
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: "Find Hotels",
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: textfieldgrey),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: textfieldgrey,
                          )),
                    ),
                    10.heightBox,
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tabs.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.selectedTab.value = index;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: ShapeDecoration(
                                    color: controller.selectedTab.value == index
                                        ? const Color(0xFFEC441E)
                                        : const Color(0xffF3F3F3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.tabs[index],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: controller.selectedTab.value ==
                                                  index
                                              ? Colors.white
                                              : const Color(0xff8B8B8B),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0.14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    20.heightBox,
                    const Divider(),
                    20.heightBox,
                    const Text(
                      'Yesterday',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    10.heightBox,
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                          physics: neverscroll,
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 72,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/hotel2.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    ),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment: crosstart,
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        const Text(
                                          'PC Hotel',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: blackcolor,
                                              size: 12.sp,
                                            ),
                                            const Text(
                                              'Lahore, Pakistan',
                                              style: TextStyle(
                                                color: Color(0xFF8B8B8B),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        20.heightBox,
                                        const Row(
                                          children: [
                                            Text(
                                              '\$30',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0.09,
                                              ),
                                            ),
                                            Text(
                                              '/per night',
                                              style: TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.13,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: crossend,
                                  mainAxisAlignment: mainbetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: const Color(
                                            0xffFFD300,
                                          ),
                                          size: 20.sp,
                                        ),
                                        const Text(
                                          '4,7',
                                          style: TextStyle(
                                            color: Color(0xFFEC441E),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    10.heightBox,
                                    const Text(
                                      '(4,594 reviews)',
                                      style: TextStyle(
                                        color: Color(0xFF22313F),
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0.13,
                                      ),
                                    ),
                                    20.heightBox,
                                    Image.asset(
                                      "assets/images/booking.png",
                                      width: 20,
                                      height: 20,
                                    )
                                  ],
                                )
                              ],
                            )
                                .box
                                .color(const Color(0x99F4F4F4))
                                .padding(pad14)
                                .rounded
                                .margin(const EdgeInsets.only(top: 10))
                                .make();
                          }),
                    ),
                  ],
                ),
                // Positioned(
                //   top: 100,
                //   child: ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: 5,
                //   itemBuilder: (context, index) => const Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: mainbetween,
                //           children: [
                //             Text(
                //               'Palazzo Hotel',
                //               textAlign: TextAlign.right,
                //               style: TextStyle(
                //                 color: Color(0xFFAFAFAF),
                //                 fontSize: 13,
                //                 fontFamily: 'Poppins',
                //                 fontWeight: FontWeight.w600,
                //                 height: 0.14,
                //               ),
                //             ),
                //             Icon(
                //               Icons.delete_outlined,
                //               color: Color(0xFFAFAFAF),
                //             ),
                //           ],
                //         ),
                //       )).box.white.outerShadow.padding(defaultpad).rounded.make(),
                // ),
              ],
            ),
          ),
        ));
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: ListView(
  //       children: [

  //         20.heightBox,
  //
  //       ],
  //     ),
  //   ));
  // }
}
