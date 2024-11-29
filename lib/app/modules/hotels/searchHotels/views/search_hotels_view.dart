import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/modules/flight/searchFlight/views/search_flight_view.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            //replaced code by Murtaza
            child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          Row(
            children: [
              Image.asset(
                backarrow,
                width: 30,
                height: 30,
              ).onTap(() {
                Get.back();
              }),
              const Spacer(),
              Center(
                child: Text(
                  'Hotels',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'City',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
          10.heightBox,
          Row(children: [
            const Icon(
              Icons.location_city,
              color: Colors.red,
            ),
            10.widthBox,
            Text(
              'Select City',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.11,
              ),
            ),
          ])
              .box
              .border(color: blackcolor.withOpacity(0.1))
              .roundedSM
              .padding(pad10)
              .make()
              .onTap(() {
            Get.bottomSheet(const MyPopup(
              isDestination: false,
            ));
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return const MyPopup(
            //       isDestination: false,
            //     );
            //   },
            // );
          }),
          10.heightBox,

          30.heightBox,
          const Text(
            'Nationality',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
          10.heightBox,
          Row(children: [
            const Icon(
              Icons.language,
              color: Colors.red,
            ),
            10.widthBox,
            Text(
              'Select Country',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.11,
              ),
            ),
            10.widthBox,
          ])
              .box
              .border(color: blackcolor.withOpacity(0.1))
              .roundedSM
              .padding(pad10)
              .make()
              .onTap(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const MyPopup(
                  isDestination: true,
                );
              },
            );
          }),
          30.heightBox,
          const Text(
            'Date',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
          10.heightBox,
          Row(children: [
            Obx(
              () => Text(
                DateFormat('yyyy-MM-dd')
                    .format(controller.startDate.value!)
                    .toString(),

                // controller.formatDate(
                //     controller.departureDate.value),
                // - ${controller.formatDate(controller.returnDate.value)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
            ),
            10.widthBox,
            10.heightBox,
            Image.asset(
              "assets/icons/dot.png",
              height: 10,
              width: 10,
            ),
            10.widthBox,
            Obx(
              () => Text(
                DateFormat('yyyy-MM-dd')
                    .format(controller.endDate.value!)
                    .toString(),

                // controller.formatDate(
                //     controller.departureDate.value),
                // - ${controller.formatDate(controller.returnDate.value)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
            )
          ])
              .box
              .border(color: blackcolor.withOpacity(0.1))
              .roundedSM
              .padding(pad20)
              .make()
              .onTap(() {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 2)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              startDate: DateTime.now(),
              backgroundColor: Colors.white,
              primaryColor: primaycolor,
              onApplyClick: (start, end) {
                controller.endDate.value = end;
                controller.startDate.value = start;
              },
              onCancelClick: () {
                controller.endDate.value = DateTime.now();
                controller.startDate.value = DateTime.now();
              },
            );
          }),

          //const SizedBox(height: 30),
          // const Text(
          //   'Adults',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 12,
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.w500,
          //     height: 0.11,
          //   ),
          // ),
          // 10.heightBox,
          // Row(children: [
          //   const Icon(
          //     Icons.location_city,
          //     color: Colors.red,
          //   ),
          //   // Image.asset(
          //   //   airplaneTakeoff,
          //   //   width: 20,
          //   //   height: 20,
          //   // ),
          //   10.widthBox,
          //   Text(
          //     'Select Children',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 14.sp,
          //       fontFamily: 'Poppins',
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   5.widthBox,
          //   Image.asset(
          //     "assets/icons/dropdown.png",
          //     height: 20,
          //     width: 20,
          //     fit: BoxFit.cover,
          //   )
          // ])
          //     .box
          //     .border(color: greyColor.withOpacity(0.6))
          //     .roundedSM
          //     .clip(Clip.antiAlias)
          //     .padding(pad16)
          //     .width(double.infinity)
          //     .make()
          //     .onTap(() {
          //   Get.bottomSheet(SelectAdultsBottomSheet());
          // }),
          //     .box
          //     .border(color: blackcolor.withOpacity(0.1))
          //     .roundedSM
          //     .padding(pad10)
          //     .make()
          //     .onTap(() {
          //   Get.bottomSheet(const MyPopup(
          //     isDestination: false,
          //   ));
          // }),
          30.heightBox,
          const Text(
            'Travellers',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
          10.heightBox,
          Column(
            crossAxisAlignment: crosstart,
            children: [
              Row(
                children: [
                  Obx(
                    () => Text(
                      controller.selectedTravelers.value > 0
                          ? "${controller.selectedTravelers.value} Travellers"
                          : "Select Travelers",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.12,
                      ),
                    ),
                  ),
                  10.widthBox,
                  // Image.asset(
                  //   "assets/icons/dot.png",
                  //   height: 5,
                  //   width: 5,
                  // ),
                  // 5.widthBox,
                  // Obx(
                  //   () => Text(
                  //     controller.selectedClass.value,
                  //     style: const TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 14,
                  //       fontFamily: 'Poppins',
                  //       fontWeight: FontWeight.w500,
                  //       height: 0.12,
                  //     ),
                  //   ),
                  // ),
                  5.widthBox,
                  Image.asset(
                    "assets/icons/dropdown.png",
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  )
                ],
              )
            ],
          )
              .box
              .border(color: greyColor.withOpacity(0.6))
              .roundedSM
              .clip(Clip.antiAlias)
              .padding(pad16)
              .width(double.infinity)
              .make()
              .onTap(() {
            Get.bottomSheet(SelectAdultsBottomSheet());
          }),
          20.heightBox,
          CustomButton(
              buttonName: "Search Hotel",
              onPressed: () async {
                // controller.getSearchedFlightData(
                //     tabController.index == 0
                //         ? "oneWay"
                //         : "roundTrip");

                // Get.toNamed(Routes.SEARCH_FLIGHT_RESULTS);
              },
              textcolor: whitecolor,
              loading: false,
              backgroundColor: Colors.red,
              rounded: false,
              height: 40.h,
              textSize: 15.sp,
              width: double.infinity),
        ],
      ),
    )));
  }

  //commented by Murtaza
  //  SafeArea(
  //   child: Padding(
  //     padding: const EdgeInsets.all(12),
  //     child: Stack(
  //       children: [
  //         Column(
  //           crossAxisAlignment: crosstart,
  //           children: [
  //             20.heightBox,
  //             TextField(
  //               onTap: () {},
  //               readOnly: true,
  //               style: TextStyle(
  //                   fontSize: 14.sp,
  //                   fontWeight: FontWeight.w500,
  //                   color: textfieldgrey),
  //               decoration: InputDecoration(
  //                   focusedBorder: OutlineInputBorder(
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(10),
  //                       ),
  //                       borderSide: BorderSide(
  //                           color: greyColor.withOpacity(0.5), width: 2)),
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(10),
  //                       ),
  //                       borderSide: BorderSide(
  //                           color: greyColor.withOpacity(0.5))),
  //                   border: OutlineInputBorder(
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(10),
  //                       ),
  //                       borderSide: BorderSide(
  //                           color: greyColor.withOpacity(0.5))),
  //                   contentPadding: const EdgeInsets.only(left: 10),
  //                   hintText: "Find Hotels",
  //                   hintStyle: TextStyle(
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.w500,
  //                       color: textfieldgrey),
  //                   suffixIcon: const Icon(
  //                     Icons.search,
  //                     color: textfieldgrey,
  //                   )),
  //             ),
  //             10.heightBox,
  //             SizedBox(
  //               height: 40.h,
  //               child: ListView.builder(
  //                   shrinkWrap: true,
  //                   scrollDirection: Axis.horizontal,
  //                   itemCount: controller.tabs.length,
  //                   itemBuilder: (context, index) {
  //                     return Obx(
  //                       () => GestureDetector(
  //                         onTap: () {
  //                           controller.selectedTab.value = index;
  //                         },
  //                         child: Container(
  //                           margin: const EdgeInsets.only(
  //                             right: 10,
  //                           ),
  //                           height: 40,
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20, vertical: 8),
  //                           decoration: ShapeDecoration(
  //                             color: controller.selectedTab.value == index
  //                                 ? const Color(0xFFEC441E)
  //                                 : const Color(0xffF3F3F3),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(29),
  //                             ),
  //                           ),
  //                           child: Row(
  //                             mainAxisSize: MainAxisSize.min,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             crossAxisAlignment:
  //                                 CrossAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 controller.tabs[index],
  //                                 textAlign: TextAlign.right,
  //                                 style: TextStyle(
  //                                   color: controller.selectedTab.value ==
  //                                           index
  //                                       ? Colors.white
  //                                       : const Color(0xff8B8B8B),
  //                                   fontSize: 13,
  //                                   fontFamily: 'Poppins',
  //                                   fontWeight: FontWeight.w600,
  //                                   height: 0.14,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     );
  //                   }),
  //             ),
  //             20.heightBox,
  //             const Divider(),
  //             20.heightBox,
  //             const Text(
  //               'Yesterday',
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 20,
  //                 fontFamily: 'Poppins',
  //                 fontWeight: FontWeight.w700,
  //                 height: 0,
  //               ),
  //             ),
  //             10.heightBox,
  //             SizedBox(
  //               height: 400.h,
  //               child: ListView.builder(
  //                   physics: neverscroll,
  //                   shrinkWrap: true,
  //                   itemCount: 7,
  //                   itemBuilder: (context, index) {
  //                     return Row(
  //                       mainAxisAlignment: mainbetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Container(
  //                               width: 70,
  //                               height: 72,
  //                               decoration: ShapeDecoration(
  //                                 image: const DecorationImage(
  //                                   image: AssetImage(
  //                                       "assets/images/hotel2.png"),
  //                                   fit: BoxFit.fill,
  //                                 ),
  //                                 shape: RoundedRectangleBorder(
  //                                     borderRadius:
  //                                         BorderRadius.circular(7)),
  //                               ),
  //                             ),
  //                             10.widthBox,
  //                             Column(
  //                               crossAxisAlignment: crosstart,
  //                               mainAxisAlignment: mainbetween,
  //                               children: [
  //                                 const Text(
  //                                   'PC Hotel',
  //                                   style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontSize: 14,
  //                                     fontFamily: 'Poppins',
  //                                     fontWeight: FontWeight.w600,
  //                                     height: 0,
  //                                   ),
  //                                 ),
  //                                 10.heightBox,
  //                                 Row(
  //                                   children: [
  //                                     Icon(
  //                                       Icons.location_pin,
  //                                       color: blackcolor,
  //                                       size: 12.sp,
  //                                     ),
  //                                     const Text(
  //                                       'Lahore, Pakistan',
  //                                       style: TextStyle(
  //                                         color: Color(0xFF8B8B8B),
  //                                         fontSize: 12,
  //                                         fontFamily: 'Poppins',
  //                                         fontWeight: FontWeight.w400,
  //                                         height: 0.12,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 20.heightBox,
  //                                 const Row(
  //                                   children: [
  //                                     Text(
  //                                       '\$30',
  //                                       style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 16,
  //                                         fontFamily: 'Poppins',
  //                                         fontWeight: FontWeight.w600,
  //                                         height: 0.09,
  //                                       ),
  //                                     ),
  //                                     Text(
  //                                       '/per night',
  //                                       style: TextStyle(
  //                                         color: Color(0xFF626262),
  //                                         fontSize: 11,
  //                                         fontFamily: 'Poppins',
  //                                         fontWeight: FontWeight.w400,
  //                                         height: 0.13,
  //                                       ),
  //                                     )
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: crossend,
  //                           mainAxisAlignment: mainbetween,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 Icon(
  //                                   Icons.star,
  //                                   color: const Color(
  //                                     0xffFFD300,
  //                                   ),
  //                                   size: 20.sp,
  //                                 ),
  //                                 const Text(
  //                                   '4,7',
  //                                   style: TextStyle(
  //                                     color: Color(0xFFEC441E),
  //                                     fontSize: 14,
  //                                     fontFamily: 'Poppins',
  //                                     fontWeight: FontWeight.w600,
  //                                     height: 0.10,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             10.heightBox,
  //                             const Text(
  //                               '(4,594 reviews)',
  //                               style: TextStyle(
  //                                 color: Color(0xFF22313F),
  //                                 fontSize: 11,
  //                                 fontFamily: 'Poppins',
  //                                 fontWeight: FontWeight.w400,
  //                                 height: 0.13,
  //                               ),
  //                             ),
  //                             20.heightBox,
  //                             Image.asset(
  //                               "assets/images/booking.png",
  //                               width: 20,
  //                               height: 20,
  //                             )
  //                           ],
  //                         )
  //                       ],
  //                     )
  //                         .box
  //                         .color(const Color(0x99F4F4F4))
  //                         .padding(pad14)
  //                         .rounded
  //                         .margin(const EdgeInsets.only(top: 10))
  //                         .make();
  //                   }),
  //             ),
  //           ],
  //         ),
  //         // Positioned(
  //         //   top: 100,
  //         //   child: ListView.builder(
  //         //   shrinkWrap: true,
  //         //   itemCount: 5,
  //         //   itemBuilder: (context, index) => const Padding(
  //         //         padding: EdgeInsets.all(8.0),
  //         //         child: Row(
  //         //           mainAxisAlignment: mainbetween,
  //         //           children: [
  //         //             Text(
  //         //               'Palazzo Hotel',
  //         //               textAlign: TextAlign.right,
  //         //               style: TextStyle(
  //         //                 color: Color(0xFFAFAFAF),
  //         //                 fontSize: 13,
  //         //                 fontFamily: 'Poppins',
  //         //                 fontWeight: FontWeight.w600,
  //         //                 height: 0.14,
  //         //               ),
  //         //             ),
  //         //             Icon(
  //         //               Icons.delete_outlined,
  //         //               color: Color(0xFFAFAFAF),
  //         //             ),
  //         //           ],
  //         //         ),
  //         //       )).box.white.outerShadow.padding(defaultpad).rounded.make(),
  //         // ),
  //       ],
  //     ),
  //   ),
  // ));
  //);
  // }
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

class SelectAdultsBottomSheet extends StatelessWidget {
  final controller = Get.put(SearchHotelsController());

  SelectAdultsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 3.2,
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 5,
            width: 100,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Adults",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "More than 12 years",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.selectedAdults.value > 0) {
                        controller.selectedAdults.value--;
                        controller.selectedTravelers.value--;
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
                        controller.selectedAdults.value.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.selectedAdults.value++;
                      controller.selectedTravelers.value++;
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Children",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "2 to 12 years",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.selectedChildren.value > 0) {
                        controller.selectedChildren.value--;
                        controller.selectedTravelers.value--;
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
                        controller.selectedChildren.value.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      //////////////////////////////////////////////////////////////////////////////////////////////
                      // if
                      // (controller.selectedChildren.value < 0)

                      //  {
                      controller.selectedChildren.value++;
                      controller.selectedTravelers.value++;
                      // }
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Child age",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Less than 2 years",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.selectedInfrants.value > 0) {
                        controller.selectedInfrants.value--;
                        controller.selectedTravelers.value--;
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
                        controller.selectedInfrants.value.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // if
                      // (controller.selectedInfrants.value == 0)

                      // {
                      controller.selectedInfrants.value++;
                      controller.selectedTravelers.value++;
                      //   }
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
          const SizedBox(height: 20),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const Text(
          //       "Class",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 14,
          //       ),
          //     ),
          //     buildRadioTile('economy'),
          //     buildRadioTile('business'),
          //     buildRadioTile('first class'),
          //   ],
          // )
        ],
      ),
    );
  }

//   Widget buildRadioTile(String value) {
//     return Row(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(fontSize: 12),
//         ),
//         const Spacer(),
//         Obx(() => Radio(
//               value: value,
//               groupValue: controller.selectedClass.value,
//               onChanged: (newValue) {
//                 controller.selectedClass.value = newValue!;
//               },
//             )),
//       ],
//     );
//   }
// }
}




// class MyPopups extends StatefulWidget {
//  final bool isDestination;

//   const MyPopups({super.key, required this.isDestination});



//   @override
//   State<MyPopup> createState() => _MyPopupState();
// }

// class _MyPopupState extends State<MyPopup> {
// //  final CitiesRepository citiesRepository = CitiesRepository();
//   final searchController = TextEditingController();
//   late Future<List<dynamic>> futureCities;

//   @override
//   void initState() {
//     super.initState();
//     futureCities = citiesRepository.fetchCities(); // Fetch cities initially
//   }

//   void _onSearchChanged() {
//     setState(() {
//       futureCities = citiesRepository.fetchCities(query: searchController.text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.8,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: Colors.white,
//         ),
//         child: Column(
//           children: [
//             // Search Bar
//             TextField(
//               onChanged: (value) => _onSearchChanged(),
//               controller: searchController,
//               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   borderSide:
//                       BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                 ),
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintText: "Search City",
//                 suffixIcon: const Icon(Icons.search, color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // FutureBuilder to display cities
//             FutureBuilder<List<dynamic>>(
//               future: futureCities,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (snapshot.hasData && snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No cities found'));
//                 } else {
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final city = snapshot.data![index];
//                         return ListTile(
//                           onTap: () {
//                             if (widget.isDestination) {
//                               // Handle Destination selection
//                               Get.back(); // Close bottom sheet
//                             } else {
//                               // Handle Origin selection
//                               Get.back(); // Close bottom sheet
//                             }
//                           },
//                           title: Text(
//                             city['title'],
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           subtitle: Text(city['en'] ?? ''),
//                         );
//                       },
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

