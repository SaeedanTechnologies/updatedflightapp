import 'package:country_picker/country_picker.dart';
import 'package:flightbooking/app/commonWidgtes/commonTextField.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/modules/hotels/hotelReservation/controllers/hotel_reservation_controller.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/hotel_reservation_information_controller.dart';

class HotelReservationInformationView
    extends GetView<HotelReservationInformationController> {
  const HotelReservationInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hotelreservationController = Get.put(HotelReservationController());
    return Scaffold(
      bottomNavigationBar:   Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(buttonName: "Confirm", onPressed: (){
                Get.toNamed(Routes.HOTEL_PAYMENT);
              }, textcolor: whitecolor, loading: false, backgroundColor: Colors.red, rounded: false, height: 40.h, textSize: 15.sp, width: double.infinity),
            ),
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: Transform.scale(
            scale: 0.7, // Adjust the scale factor as needed
            child: Image.asset(
                backarrow), // Replace 'backarrow.png' with your asset path
          ),
          title: const Text(
            'Details Of Reservation',
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
              child: ListView.builder(
                  itemCount: hotelreservationController.selectedPersons.value,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        20.heightBox,
                        const Text(
                          "Full Name",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: textfieldgrey),
                        ),
                        5.heightBox,
                        commonTextField(
                            icon: nameicon,
                            hinttext: "Enter your name here",
                            textEditingController:
                                controller.nameController.value),
                        20.heightBox,
                        const Text('DOB',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: textfieldgrey)),
                        5.heightBox,
                        Obx(
                          () => TextField(
                            onTap: () {
                              controller.selectDate(context);
                            },
                            readOnly: true,
                            controller: controller.dobController.value,
                            cursorHeight: 15.h,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: textfieldgrey),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: textfieldgrey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: textfieldgrey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: textfieldgrey)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 10),
                                child: SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Image.asset(
                                    dob,
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
                        20.heightBox,
                        const Text('Country',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: textfieldgrey)),
                        5.heightBox,
                        Obx(
                          () => TextField(
                            controller: controller.countryController.value,
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: CountryListThemeData(
                                    margin: const EdgeInsets.only(top: 30),
                                    padding: const EdgeInsets.only(top: 30),
                                    flagSize: 25,
                                    backgroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.blueGrey),
                                    bottomSheetHeight:
                                        500, // Optional. Country list modal height
                                    //Optional. Sets the border radius for the bottomsheet.
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                    //Optional. Styles the search field.
                                    inputDecoration: InputDecoration(
                                      labelText: 'Search',
                                      hintText: 'Start typing to search',
                                      prefixIcon: const Icon(Icons.search),
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: (Country country) {
                                    controller.countryController.value.text =
                                        "+${country.phoneCode}";
                                    controller.countryImage.value =
                                        country.flagEmoji;
                                  });
                            },
                            readOnly: true,
                            cursorHeight: 15.h,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: textfieldgrey),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: textfieldgrey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: textfieldgrey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: textfieldgrey)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 10),
                                child: Obx(
                                  () => controller.countryImage.value == ""
                                      ? SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Image.asset(
                                            globe,
                                            fit: BoxFit.scaleDown,
                                          ))
                                      : Text(
                                          controller.countryImage.value,
                                          style: TextStyle(fontSize: 32.sp),
                                        ),
                                ),
                              ),
                              suffixIcon:
                                  const Icon(Icons.arrow_drop_down_outlined),
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 15, bottom: 15),
                              hintText: "Country Code",
                              hintStyle: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textfieldgrey),
                            ),
                          ),
                        ),
                        20.heightBox,
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: textfieldgrey),
                        ),
                        5.heightBox,
                        commonTextField(
                            icon: "assets/icons/emailblackicon.png",
                            hinttext: "Enter your email here",
                            textEditingController:
                                controller.emailController.value),
                        30.heightBox,
                        Container(
                            height: 2, // Adjust height as needed
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2, // Adjust thickness as needed
                                  color: Colors.black, // Adjust color as needed
                                ),
                              ),
                            ))
                      ],
                    );
                  })),
        ));
  }
}
