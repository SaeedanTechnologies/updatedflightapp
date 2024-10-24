import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/resources/physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/recently_booked_controller.dart';

class RecentlyBookedView extends GetView<RecentlyBookedController> {
  const RecentlyBookedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Image.asset(
                  backarrow,
                  width: 40,
                  height: 40,
                ),
                const Spacer(),
                const Text(
                  'Recently Booked',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          10.heightBox,
          Expanded(
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
                                image: AssetImage("assets/images/hotel2.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
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
    ));
  }
}
