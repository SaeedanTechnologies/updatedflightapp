import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/modules/cardInformation/controllers/card_information_controller.dart';
import 'package:flightbooking/app/modules/hotels/HotelPayment/controllers/hotel_payment_controller.dart';
import 'package:flightbooking/app/modules/hotels/hotelReservation/controllers/hotel_reservation_controller.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/review_hotel_booking_details_controller.dart';

class ReviewHotelBookingDetailsView
    extends GetView<ReviewHotelBookingDetailsController> {
  const ReviewHotelBookingDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hotelreservationController = Get.put(HotelReservationController());
    final hotelpaymentcontroller = Get.put(HotelPaymentController());
    final cardController = Get.put(CardInformationController());
    return Scaffold(
        backgroundColor: whitecolor,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
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
                  .make(),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: mainbetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        const Text(
                          'Check In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                          ),
                        ),
                        10.heightBox,
                        Obx(
                          () => SizedBox(
                            width: 160.w,
                            child: TextField(
                              readOnly: true,
                              controller:
                                  hotelreservationController.startingDate.value,
                              cursorHeight: 15.h,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textfieldgrey),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: greyColor.withOpacity(0.4))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: greyColor.withOpacity(0.4))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: greyColor.withOpacity(0.4))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Image.asset(
                                      calender,
                                      color: textfieldgrey,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 15, bottom: 15),
                                hintText: "12/05/1990",
                                hintStyle: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textfieldgrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        const Text(
                          'Check Out',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                          ),
                        ),
                        10.heightBox,
                        Obx(
                          () => SizedBox(
                            width: 160.w,
                            child: TextField(
                              readOnly: true,
                              controller:
                                  hotelreservationController.endingDate.value,
                              cursorHeight: 15.h,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textfieldgrey),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: greyColor.withOpacity(0.4))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: greyColor.withOpacity(0.4))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: greyColor.withOpacity(0.4))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Image.asset(
                                      calender,
                                      color: textfieldgrey,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 15, bottom: 15),
                                hintText: "12/05/1990",
                                hintStyle: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textfieldgrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/persons.png",
                          height: 20,
                          width: 20,
                        ),
                        10.widthBox,
                        Obx(
                          () => Text(
                            '${hotelreservationController.selectedPersons.value} person',
                            style: TextStyle(
                              color: const Color(0xFF626262),
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.16,
                            ),
                          ),
                        ),
                        10.widthBox,
                      ],
                    )
                        .box
                        .color(const Color.fromARGB(255, 241, 242, 241))
                        .padding(pad16)
                        .roundedLg
                        .make(),
                    Image.asset(
                      "assets/icons/smallline.png",
                      width: 80,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/persons.png",
                          height: 20,
                          width: 20,
                        ),
                        10.widthBox,
                        Obx(
                          () => Text(
                            '${hotelreservationController.selectedPersons.value} person',
                            style: TextStyle(
                              color: const Color(0xFF626262),
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.16,
                            ),
                          ),
                        ),
                        10.widthBox,
                      ],
                    )
                        .box
                        .color(const Color.fromARGB(255, 241, 242, 241))
                        .padding(pad16)
                        .roundedLg
                        .make(),
                  ],
                ),
              ),
              Column(
                children: [
                  10.heightBox,
                  const Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Text(
                        '5 Nights',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      Text(
                        '\$435.00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  20.heightBox,
                  const Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Text(
                        'Taxes & Fees ( 10%)',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      Text(
                        '\$40.50',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  20.heightBox,
                  const Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      Text(
                        '\$230',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFEC441E),
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  10.heightBox,
                ],
              )
                  .box
                  .white
                  .outerShadow
                  .rounded
                  .padding(pad14)
                  .margin(pad10)
                  .make(),
              Container(
                padding: const EdgeInsets.all(8),
                width: 390,
                height: 72,
                decoration: ShapeDecoration(
                  color: const Color(0x70F2EBE1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                        Text(
                          cardController.cardNumber.value.text.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Radio(
                          hoverColor: Colors.red,
                          activeColor: Colors.red,
                          value: 'Credit Card',
                          groupValue: hotelpaymentcontroller
                              .selectedPaymentMethod.value,
                          onChanged: (value) {
                            hotelpaymentcontroller.updatePaymentMethod(value!);
                          },
                        )),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    buttonName: "Confirm",
                    onPressed: () {
                      EmojiAlert(
                        height: 300.h,
                        alertTitle: const Text(
                          'Payment Successful',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFEC441E),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        description: Column(children: [
                          Image.asset(
                            "assets/icons/done.png",
                            height: 50,
                            width: 50,
                          ),
                          20.heightBox,
                          const Text(
                            'Thank you! Your paymennt of \$230.00 has been processed successfully.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF626262),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          20.heightBox,
                          CustomButton(
                              buttonName: "View Ticket",
                              onPressed: () {},
                              textcolor: whitecolor,
                              loading: false,
                              backgroundColor: Colors.red,
                              rounded: true,
                              height: 40.h,
                              textSize: 15.sp,
                              width: 100.w)
                        ]),
                        cancelable: true,
                        emojiType: EMOJI_TYPE.JOYFUL,
                      ).displayAlert(context);
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: Colors.red,
                    rounded: false,
                    height: 40.h,
                    textSize: 15.sp,
                    width: double.infinity),
              ),
              20.heightBox,
            ],
          ),
        ));
  }
}
