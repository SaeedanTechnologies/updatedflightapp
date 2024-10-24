import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../commonWidgtes/customelevatedButton.dart';
import '../controllers/hotel_payment_controller.dart';

class HotelPaymentView extends GetView<HotelPaymentController> {
  const HotelPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: Transform.scale(
            scale: 0.7, // Adjust the scale factor as needed
            child: Image.asset(
                backarrow), // Replace 'backarrow.png' with your asset path
          ),
          title: const Text(
            'Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0.08,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      'Add New Card',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFEC441E),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
                20.heightBox,
                Container(
                  width: 390,
                  height: 72,
                  decoration: ShapeDecoration(
                    color: const Color(0x70F2EBE1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/creditcard.png",
                              width: 40,
                              height: 40,
                            ),
                            10.widthBox,
                            const Text(
                              'Credit Card',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: 0.20,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Radio(
                              hoverColor: Colors.red,
                              activeColor: Colors.red,
                              value: 'Credit Card',
                              groupValue:
                                  controller.selectedPaymentMethod.value,
                              onChanged: (value) {
                                controller.updatePaymentMethod(value!);
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                20.heightBox,
                Container(
                  width: 390,
                  height: 72,
                  decoration: ShapeDecoration(
                    color: const Color(0x70F2EBE1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/paypal.png",
                              width: 40,
                              height: 40,
                            ),
                            10.widthBox,
                            const Text(
                              'Pay Pal',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                                letterSpacing: 0.20,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Radio(
                              hoverColor: Colors.red,
                              activeColor: Colors.red,
                              value: 'Paypal',
                              groupValue:
                                  controller.selectedPaymentMethod.value,
                              onChanged: (value) {
                                controller.updatePaymentMethod(value!);
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      buttonName: "Confirm",
                      onPressed: () {
                        Get.toNamed(Routes.CARD_INFORMATION);
                      },
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: Colors.red,
                      rounded: false,
                      height: 40.h,
                      textSize: 15.sp,
                      width: double.infinity),
                ),
              ],
            ),
          ),
        ));
  }
}
