import 'package:country_picker/country_picker.dart';
import 'package:flightbooking/app/commonWidgtes/commonTextField.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/modules/flight/searchFlight/controllers/search_flight_controller.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/icons.dart';
import '../controllers/add_passenger_controller.dart';

class AddPassengerView extends GetView<AddPassengerController> {
  const AddPassengerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flightSearchController = Get.put(SearchFlightController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: crosstart,
            children: [
              30.heightBox,
              const Text(
                'Add Passenger',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
              10.heightBox,
              const SizedBox(
                width: 390,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor sit amet consectetur. ',
                  style: TextStyle(
                    color: Color(0xFF626262),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ).box.rounded.make(),
              10.heightBox,
              Expanded(
                child: ListView.builder(
                    // physics: neverscroll,

                    itemCount: flightSearchController.selectedTravelers.value,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          40.heightBox,
                          Text(
                            'Basic Information of Passenger ${index + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                            ),
                          ),
                          30.heightBox,
                          const Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.11,
                            ),
                          ),
                          10.heightBox,
                          commonTextField(
                              icon: nameicon,
                              hinttext: "Enter your name here",
                              textEditingController:
                                  controller.nameController.value),
                          20.heightBox,
                          const Text(
                            'DOB',
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
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
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
                          const Text(
                            'Country',
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
                                          country.displayName;
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
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Image.asset(
                                      globe,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                suffixIcon:
                                    const Icon(Icons.arrow_drop_down_outlined),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 15, bottom: 15),
                                hintText: "Country",
                                hintStyle: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textfieldgrey),
                              ),
                            ),
                          ),
                          20.heightBox,
                          const Text(
                            'Gender',
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
                            () => TextField(
                              onTap: () {
                                Get.defaultDialog(
                                  title: 'Select Gender',
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(() => RadioListTile<String>(
                                            title: const Text('Male'),
                                            value: 'Male',
                                            groupValue:
                                                controller.selectedGender.value,
                                            onChanged: (value) {
                                              controller.selectedGender.value =
                                                  value!;
                                              Get.back(result: value);
                                            },
                                          )),
                                      Obx(() => RadioListTile<String>(
                                            title: const Text('Female'),
                                            value: 'Female',
                                            groupValue:
                                                controller.selectedGender.value,
                                            onChanged: (value) {
                                              controller.selectedGender.value =
                                                  value!;
                                              Get.back(result: value);
                                            },
                                          )),
                                    ],
                                  ),
                                );
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
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Image.asset(
                                      nameicon,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                suffixIcon:
                                    const Icon(Icons.arrow_drop_down_outlined),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 15, bottom: 15),
                                hintText: controller.selectedGender.value,
                                hintStyle: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textfieldgrey),
                              ),
                            ),
                          ),
                          30.heightBox,
                          const Text(
                            'Passport information',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                            ),
                          ),
                          30.heightBox,
                          const Text(
                            'Passport',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.11,
                            ),
                          ),
                          10.heightBox,
                          commonTextField(
                              icon: passport,
                              hinttext: "ED 25265 589",
                              textEditingController:
                                  controller.passportController.value),
                          20.heightBox,
                          const Text(
                            'Expiry Date',
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
                            () => TextField(
                              onTap: () {
                                controller.selectExpiryDate(context);
                              },
                              readOnly: true,
                              controller: controller.expiryController.value,
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
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Image.asset(
                                      calender,
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
                        ],
                      );
                    }),
              ),
              20.heightBox,
              CustomButton(
                  buttonName: "Save",
                  onPressed: () {},
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: Colors.red,
                  rounded: false,
                  height: 40.h,
                  textSize: 16.sp,
                  width: double.infinity)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
