import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/card_information_controller.dart';

class CardInformationView extends StatefulWidget {
  const CardInformationView({Key? key}) : super(key: key);

  @override
  State<CardInformationView> createState() => _CardInformationViewState();
}

class _CardInformationViewState extends State<CardInformationView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardInformationController());
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
        body: ListView(
          children: [
            CreditCardWidget(
              cardType: CardType.mastercard,
              enableFloatingCard: true,
              isHolderNameVisible: true,
              chipColor: Colors.orange,
              cardBgColor: blackcolor,
              obscureCardCvv: false,
              cardNumber: controller.cardNumber.value.text,
              expiryDate: controller.expiryCode.value.text,
              cardHolderName: controller.cardHolderName.value.text,
              cvvCode: controller.cvcCode.value.text,
              showBackView: controller
                  .showback, //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              customCardTypeIcons: [
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/icons/creditcard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cardHolderName.value,
                    cursorHeight: 15.h,
                    onTap: () {
                      controller.showback = false;
                    },
                    onChanged: (val) {
                      controller.cardHolderName.value.text = val;
                      setState(() {});
                    },
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: textfieldgrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset(
                            nameicon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "Card holder name",
                      hintStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ),
                  20.heightBox,
                  TextField(
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    controller: controller.cardNumber.value,
                    cursorHeight: 15.h,
                    onTap: () {
                      controller.showback = false;
                    },
                    onChanged: (val) {
                      controller.cardNumber.value.text = val;
                      setState(() {});
                    },
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: textfieldgrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset(
                            nameicon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "1234 1234 1234 1234",
                      hintStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ),
                  20.heightBox,
                  TextField(
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    controller: controller.expiryCode.value,
                    cursorHeight: 15.h,
                    onTap: () {
                      controller.showback = false;
                    },
                    onChanged: (val) {
                      controller.expiryCode.value.text.length == 2
                          ? controller.expiryCode.value.text =
                              '${controller.expiryCode.value.text}/'
                          : controller.expiryCode.value.text = val;
                      setState(() {});
                    },
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: textfieldgrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset(
                            calender,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "12/24",
                      hintStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ),
                  20.heightBox,
                  TextField(
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    controller: controller.cvcCode.value,
                    cursorHeight: 15.h,
                    onTap: () {
                      controller.showback = true;
                    },
                    onChanged: (val) {
                      controller.cvcCode.value.text = val;
                      setState(() {});
                    },
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: textfieldgrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: textfieldgrey)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset(
                            nameicon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "xxx",
                      hintStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ),
                ],
              ),
            ),
            40.heightBox,
            CustomButton(
                buttonName: "Continue",
                onPressed: () {
                  Get.toNamed(Routes.REVIEW_HOTEL_BOOKING_DETAILS);
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: Colors.red,
                rounded: false,
                height: 40.h,
                textSize: 15.sp,
                width: double.infinity)
          ],
        ));
  }
}
