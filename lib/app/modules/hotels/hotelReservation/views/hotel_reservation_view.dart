import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/hotel_reservation_controller.dart';

class HotelReservationView extends GetView<HotelReservationController> {
  const HotelReservationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateRange? selectedDateRange;
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: Transform.scale(
            scale: 0.7, // Adjust the scale factor as needed
            child: Image.asset(
                backarrow), // Replace 'backarrow.png' with your asset path
          ),
          title: const Text(
            'Select Date',
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
            Center(
              child: SizedBox(
                height: 350.h,
                child: DateRangePickerWidget(
                  minDate: DateTime.now(),
                  maxDate: DateTime(2050),
                  theme: CalendarTheme(
                      selectedColor: Colors.red,
                      inRangeColor: Colors.red,
                      inRangeTextStyle: const TextStyle(color: whitecolor),
                      selectedTextStyle: const TextStyle(color: whitecolor),
                      todayTextStyle: const TextStyle(color: textfieldgrey),
                      defaultTextStyle: const TextStyle(
                        color: blackcolor,
                      ),
                      disabledTextStyle: const TextStyle(color: textfieldgrey),
                      radius: 50,
                      tileSize: 43.h),
                  doubleMonth: false,
                  maximumDateRangeLength: 30,
                  minimumDateRangeLength: 1,
                  initialDateRange: selectedDateRange,
                  initialDisplayedDate:
                      // ignore: dead_code
                      selectedDateRange?.start ?? DateTime.now(),
                  onDateRangeChanged: (date) {
                    controller.startingDate.value.text =
                        controller.formatDate(date!.start);
                    controller.endingDate.value.text =
                        controller.formatDate(date.end);
                  },
                ),
              ).box.border(color: greyColor).rounded.margin(defaultpad).make(),
            ),
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
                            controller: controller.startingDate.value,
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
                                padding:
                                    const EdgeInsets.only(right: 20, left: 10),
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
                            controller: controller.endingDate.value,
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
                                padding:
                                    const EdgeInsets.only(right: 20, left: 10),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Guest',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
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
                          '${controller.selectedPersons.value} person',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.selectedPersons.value > 1) {
                            controller.selectedPersons.value--;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          color: Colors.white,
                          child: Icon(
                            Icons.remove,
                            size: 14.sp,
                          )
                              .box
                              .white
                              .outerShadow
                              .rounded
                              .padding(const EdgeInsets.all(4))
                              .make(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Obx(() => Text(
                            controller.selectedPersons.value.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          controller.selectedPersons.value++;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          color: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 14.sp,
                          )
                              .box
                              .white
                              .outerShadow
                              .rounded
                              .padding(const EdgeInsets.all(4))
                              .make(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            20.heightBox,
            const Center(
              child: Text(
                'Total : \$500',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(buttonName: "Continue", onPressed: (){
                Get.toNamed(Routes.HOTEL_RESERVATION_INFORMATION);
              }, textcolor: whitecolor, loading: false, backgroundColor: Colors.red, rounded: false, height: 40.h, textSize: 15.sp, width: double.infinity),
            )
          ],
        ));
  }
}
