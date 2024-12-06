import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getFlightRules.dart';
import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/flight_details_controller.dart';

class FlightDetailsView extends GetView<FlightDetailsController> {
  final FlightsRepository flightsRepository = FlightsRepository();
  FlightDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var flightDetails = Get.arguments[0];
    var tripeType = Get.arguments[1];

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: mainaround,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total Price :',
                      style: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                    Text(
                      '${flightDetails['priceInfo']['currency']['symbol']} ${flightDetails['priceInfo']['baseFare'].toString()}',
                      style: const TextStyle(
                        color: Color(0xFFEC441E),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                      ),
                    )
                  ],
                ),
                CustomButton(
                    buttonName: "Continue",
                    onPressed: () {
                      flightsRepository.createBookingRequest();

                      Get.toNamed(Routes.ADD_PASSENGER);
                      // Get.bottomSheet(
                      //   Container(
                      //     padding: const EdgeInsets.all(20),
                      //     child: Column(
                      //       children: [
                      //         Container()
                      //             .box
                      //             .color(greyColor.withOpacity(0.5))
                      //             .roundedSM
                      //             .width(50.w)
                      //             .height(5.h)
                      //             .make(),
                      //         30.heightBox,
                      //         Row(
                      //           mainAxisAlignment: mainbetween,
                      //           children: [
                      //             const Text(
                      //               'Add Passenger',
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 20,
                      //                 fontFamily: 'Poppins',
                      //                 fontWeight: FontWeight.w600,
                      //                 height: 0.08,
                      //               ),
                      //             ),
                      //             Image.asset(
                      //               "assets/icons/cancel.png",
                      //               width: 20,
                      //               height: 20,
                      //             ).onTap(() {
                      //               Get.back();
                      //             }),
                      //           ],
                      //         ),
                      //         10.heightBox,
                      //         const SizedBox(
                      //           width: 390,
                      //           child: Text(
                      //             'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor sit amet consectetur. ',
                      //             style: TextStyle(
                      //               color: Color(0xFF626262),
                      //               fontSize: 14,
                      //               fontFamily: 'Poppins',
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //         20.heightBox,
                      //         Row(
                      //           children: [
                      //             Image.asset(
                      //               "assets/icons/scanner.png",
                      //               width: 30,
                      //               height: 30,
                      //             )
                      //                 .box
                      //                 .color(const Color.fromARGB(
                      //                     255, 235, 234, 234))
                      //                 .padding(defaultpad)
                      //                 .roundedSM
                      //                 .make(),
                      //             10.widthBox,
                      //             Column(
                      //               crossAxisAlignment: crosstart,
                      //               children: [
                      //                 const Text(
                      //                   'Passport Scanner',
                      //                   style: TextStyle(
                      //                     color: Color(0xFF191919),
                      //                     fontSize: 16,
                      //                     fontFamily: 'Poppins',
                      //                     fontWeight: FontWeight.w600,
                      //                     height: 0.09,
                      //                   ),
                      //                 ),
                      //                 10.heightBox,
                      //                 const Text(
                      //                   'Lorem ipsum dolor sit amet consectetur.',
                      //                   style: TextStyle(
                      //                     color: Color(0xFF626262),
                      //                     fontSize: 13,
                      //                     fontFamily: 'Poppins',
                      //                     fontWeight: FontWeight.w400,
                      //                     height: 0,
                      //                   ),
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //         30.heightBox,
                      //         Row(
                      //           children: [
                      //             Image.asset(
                      //               "assets/icons/form.png",
                      //               width: 30,
                      //               height: 30,
                      //             )
                      //                 .box
                      //                 .color(const Color.fromARGB(
                      //                     255, 235, 234, 234))
                      //                 .padding(defaultpad)
                      //                 .roundedSM
                      //                 .make(),
                      //             10.widthBox,
                      //             Column(
                      //               crossAxisAlignment: crosstart,
                      //               children: [
                      //                 const Text(
                      //                   'Traveler Form',
                      //                   style: TextStyle(
                      //                     color: Color(0xFF191919),
                      //                     fontSize: 16,
                      //                     fontFamily: 'Poppins',
                      //                     fontWeight: FontWeight.w600,
                      //                     height: 0.09,
                      //                   ),
                      //                 ),
                      //                 10.heightBox,
                      //                 SizedBox(
                      //                   width: 250.w,
                      //                   child: const Text(
                      //                     'Lorem ipsum dolor sit amet consectetur. ipsum dolor sit amet consectetur.',
                      //                     style: TextStyle(
                      //                       color: Color(0xFF626262),
                      //                       fontSize: 13,
                      //                       fontFamily: 'Poppins',
                      //                       fontWeight: FontWeight.w400,
                      //                       height: 0,
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //         Spacer(),
                      //         CustomButton(
                      //             buttonName: "Confirm",
                      //             onPressed: () {
                      //             },
                      //             textcolor: whitecolor,
                      //             loading: false,
                      //             backgroundColor: Colors.red,
                      //             rounded: false,
                      //             height: 40.h,
                      //             textSize: 16.sp,
                      //             width: double.infinity)
                      //       ],
                      //     ),
                      //   ),
                      //   backgroundColor: Colors.white,
                      // );
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: Colors.red,
                    rounded: true,
                    height: 40.h,
                    textSize: 18.sp,
                    width: 130.w)
              ],
            ),
          ).box.white.outerShadow.make(),
          appBar: AppBar(
            leadingWidth: 40,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                backarrow,
                height: 20,
                width: 20,
              ).onTap(() {
                Get.back();
              }),
            ),
            title: Row(
              mainAxisAlignment: maincenter,
              children: [
                Text(
                  flightDetails['serviceInfo']['legs'][0]['info']['departure']
                          ['city']
                      .toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(
                  "assets/icons/flightto.png",
                  width: 25,
                  height: 25,
                ),
                Text(
                  flightDetails['serviceInfo']['legs'][0]['info']['arrival']
                          ['city']
                      .toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Ticket Info'),
                Tab(text: 'Ticket Policy'),
              ],
              indicatorColor: Colors.red, // Set active color to red
              labelColor: Colors.red, // Set active label text color to red
              unselectedLabelColor:
                  Colors.grey, // Set non-active label text color to grey
            ),
          ),
          body: TabBarView(
            children: [
              tripeType == "roundTrip"
                  ? PageView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20, top: 10),
                          child: Stack(
                            children: [
                              Image.asset("assets/icons/bg.png"),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    const Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Text(
                                          'Departure',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        Text(
                                          'Direct',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    5.heightBox,
                                    Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split('(')[0],
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Trip Duration: ',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFF808991),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            5.widthBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][0]['info']
                                                  ['duration'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    5.heightBox,
                                    Row(
                                      children: [
                                        const Text(
                                          'Flight to:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF808991),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        5.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['arrival']
                                                  ['airport']['abb']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    10.heightBox,
                                    Row(
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split(', ')[1],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: const Color(0xFF808991),
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 90.widthBox
                                            : 70.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['airport']['abb']
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                            .box
                                            .padding(defaultpad)
                                            .roundedSM
                                            .color(Colors.grey.withOpacity(0.2))
                                            .make(),
                                        20.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['city']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    20.heightBox,
                                    Row(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        23.widthBox,
                                        Column(
                                          crossAxisAlignment: crossend,
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                          ['legs'][0]['info']
                                                      ['departure']['date_time']
                                                  .toString()
                                                  .split(' ')[4],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                          ['legs'][0]['info']
                                                      ['departure']['date_time']
                                                  .toString()
                                                  .split(', ')[0],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 70.widthBox
                                            : 40.widthBox,
                                        FutureBuilder<Widget>(
                                          future: controller.fetchflightLogo(
                                              flightDetails['serviceInfo']
                                                      ['legs'][0]['info']
                                                  ['airline']['logo']),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              return snapshot.data ??
                                                  const Text('No Image');
                                            }
                                          },
                                        ),
                                        10.widthBox,
                                        Column(
                                          mainAxisAlignment: maincenter,
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][0]['info']
                                                  ['airline']['en'],
                                              style: const TextStyle(
                                                color: Color(0xFF191919),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              'Flight No : ${flightDetails['serviceInfo']['legs'][0]['info']['flight_number']}',
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    20.heightBox,
                                    Row(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        Column(
                                          crossAxisAlignment: crossend,
                                          children: [
                                            const Text(
                                              'Flight Time',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFF808991),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][0]['info']
                                                  ['departure']['time'],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 80.widthBox
                                            : 50.widthBox,
                                        Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/usb.png",
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  5.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                            ['legs'][0]['info']
                                                        ['cabin'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                              Row(
                                                crossAxisAlignment: crosstart,
                                                mainAxisAlignment: mainstart,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/simpleflight.png",
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                  10.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                                ['legs'][0]
                                                            ['segments'][0]
                                                        ['airline']['title'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/laggage.png",
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  5.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                                ['legs'][0]
                                                            ['segments'][0]
                                                        ['luggage'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                            ])
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['arrival']['date_time']
                                          .toString()
                                          .split(', ')[1],
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: const Color(0xFF808991),
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['arrival']['date_time']
                                          .toString()
                                          .split(' ')[4],
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: crosscenter,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['arrival']
                                                  ['date_time']
                                              .toString()
                                              .split(', ')[0],
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 105.widthBox
                                            : 75.widthBox,
                                        Row(
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                              ['legs'][0]
                                                          ['info']['arrival']
                                                      ['airport']['city']['abb']
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                                .box
                                                .padding(defaultpad)
                                                .roundedSM
                                                .color(Colors.grey
                                                    .withOpacity(0.2))
                                                .make(),
                                            10.widthBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                              ['legs'][0]
                                                          ['info']['arrival']
                                                      ['airport']['city']['en']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    60.heightBox,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20, top: 10),
                          child: Stack(
                            children: [
                              Image.asset("assets/icons/bg.png"),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    const Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Text(
                                          'Arrival',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        Text(
                                          'Direct',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    5.heightBox,
                                    Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split('(')[0],
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Trip Duration: ',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFF808991),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            5.widthBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][1]['info']
                                                  ['duration'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    5.heightBox,
                                    Row(
                                      children: [
                                        const Text(
                                          'Flight to:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF808991),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        5.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['arrival']
                                                  ['airport']['abb']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    10.heightBox,
                                    Row(
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split(', ')[1],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: const Color(0xFF808991),
                                            fontSize: 12.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 90.widthBox
                                            : 70.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['departure']
                                                  ['airport']['abb']
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                            .box
                                            .padding(defaultpad)
                                            .roundedSM
                                            .color(Colors.grey.withOpacity(0.2))
                                            .make(),
                                        20.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['departure']
                                                  ['city']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    20.heightBox,
                                    Row(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        23.widthBox,
                                        Column(
                                          crossAxisAlignment: crossend,
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                          ['legs'][1]['info']
                                                      ['departure']['date_time']
                                                  .toString()
                                                  .split(' ')[4],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                          ['legs'][1]['info']
                                                      ['departure']['date_time']
                                                  .toString()
                                                  .split(', ')[0],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 70.widthBox
                                            : 40.widthBox,
                                        FutureBuilder<Widget>(
                                          future: controller.fetchflightLogo(
                                              flightDetails['serviceInfo']
                                                      ['legs'][1]['info']
                                                  ['airline']['logo']),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              return snapshot.data ??
                                                  const Text('No Image');
                                            }
                                          },
                                        ),
                                        10.widthBox,
                                        Column(
                                          mainAxisAlignment: maincenter,
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][1]['info']
                                                  ['airline']['en'],
                                              style: const TextStyle(
                                                color: Color(0xFF191919),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              'Flight No : ${flightDetails['serviceInfo']['legs'][1]['info']['flight_number']}',
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    20.heightBox,
                                    Row(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        Column(
                                          crossAxisAlignment: crossend,
                                          children: [
                                            const Text(
                                              'Flight Time',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFF808991),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            5.heightBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                      ['legs'][1]['info']
                                                  ['departure']['time'],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 80.widthBox
                                            : 50.widthBox,
                                        Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/usb.png",
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  5.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                            ['legs'][1]['info']
                                                        ['cabin'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                              Row(
                                                crossAxisAlignment: crosstart,
                                                mainAxisAlignment: mainstart,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/simpleflight.png",
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                  10.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                                ['legs'][1]
                                                            ['segments'][0]
                                                        ['airline']['title'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/laggage.png",
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  5.widthBox,
                                                  Text(
                                                    flightDetails['serviceInfo']
                                                                ['legs'][1]
                                                            ['segments'][0]
                                                        ['luggage'],
                                                    style: const TextStyle(
                                                      color: Color(0xFF808991),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              10.heightBox,
                                            ])
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      flightDetails['serviceInfo']['legs'][1]
                                              ['info']['arrival']['date_time']
                                          .toString()
                                          .split(', ')[1],
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: const Color(0xFF808991),
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      flightDetails['serviceInfo']['legs'][1]
                                              ['info']['arrival']['date_time']
                                          .toString()
                                          .split(' ')[4],
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: crosscenter,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [1]['info']['arrival']
                                                  ['date_time']
                                              .toString()
                                              .split(', ')[0],
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width > 410
                                            ? 105.widthBox
                                            : 75.widthBox,
                                        Row(
                                          children: [
                                            Text(
                                              flightDetails['serviceInfo']
                                                              ['legs'][1]
                                                          ['info']['arrival']
                                                      ['airport']['city']['abb']
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                                .box
                                                .padding(defaultpad)
                                                .roundedSM
                                                .color(Colors.grey
                                                    .withOpacity(0.2))
                                                .make(),
                                            10.widthBox,
                                            Text(
                                              flightDetails['serviceInfo']
                                                              ['legs'][1]
                                                          ['info']['arrival']
                                                      ['airport']['city']['en']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    60.heightBox,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 20, top: 10),
                      child: Stack(
                        children: [
                          Image.asset("assets/icons/bg.png"),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                const Row(
                                  mainAxisAlignment: mainbetween,
                                  children: [
                                    Text(
                                      'Departure',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      'Direct',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                5.heightBox,
                                Row(
                                  mainAxisAlignment: mainbetween,
                                  children: [
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['departure']['date_time']
                                          .toString()
                                          .split('(')[0],
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Trip Duration: ',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF808991),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        5.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                              [0]['info']['duration'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                5.heightBox,
                                Row(
                                  children: [
                                    const Text(
                                      'Flight to:',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF808991),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    5.widthBox,
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                                  ['info']['arrival']['airport']
                                              ['abb']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                10.heightBox,
                                Row(
                                  children: [
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['departure']['date_time']
                                          .toString()
                                          .split(', ')[1],
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: const Color(0xFF808991),
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    MediaQuery.sizeOf(context).width > 410
                                        ? 90.widthBox
                                        : 70.widthBox,
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                                  ['info']['departure']
                                              ['airport']['abb']
                                          .toString(),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                        .box
                                        .padding(defaultpad)
                                        .roundedSM
                                        .color(Colors.grey.withOpacity(0.2))
                                        .make(),
                                    20.widthBox,
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['departure']['city']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                20.heightBox,
                                Row(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    23.widthBox,
                                    Column(
                                      crossAxisAlignment: crossend,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split(' ')[4],
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                        5.heightBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['departure']
                                                  ['date_time']
                                              .toString()
                                              .split(', ')[0],
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    MediaQuery.sizeOf(context).width > 410
                                        ? 70.widthBox
                                        : 40.widthBox,
                                    FutureBuilder<Widget>(
                                      future: controller.fetchflightLogo(
                                          flightDetails['serviceInfo']['legs']
                                              [0]['info']['airline']['logo']),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          return snapshot.data ??
                                              const Text('No Image');
                                        }
                                      },
                                    ),
                                    10.widthBox,
                                    Column(
                                      mainAxisAlignment: maincenter,
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                              [0]['info']['airline']['en'],
                                          style: const TextStyle(
                                            color: Color(0xFF191919),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        5.heightBox,
                                        Text(
                                          'Flight No : ${flightDetails['serviceInfo']['legs'][0]['info']['flight_number']}',
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                20.heightBox,
                                Row(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    Column(
                                      crossAxisAlignment: crossend,
                                      children: [
                                        const Text(
                                          'Flight Time',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF808991),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        5.heightBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                              [0]['info']['departure']['time'],
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    MediaQuery.sizeOf(context).width > 410
                                        ? 80.widthBox
                                        : 50.widthBox,
                                    Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/icons/usb.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              5.widthBox,
                                              Text(
                                                flightDetails['serviceInfo']
                                                        ['legs'][0]['info']
                                                    ['cabin'],
                                                style: const TextStyle(
                                                  color: Color(0xFF808991),
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              )
                                            ],
                                          ),
                                          10.heightBox,
                                          Row(
                                            crossAxisAlignment: crosstart,
                                            mainAxisAlignment: mainstart,
                                            children: [
                                              Image.asset(
                                                "assets/icons/simpleflight.png",
                                                width: 15,
                                                height: 15,
                                              ),
                                              10.widthBox,
                                              Text(
                                                flightDetails['serviceInfo']
                                                        ['legs'][0]['segments']
                                                    [0]['airline']['title'],
                                                style: const TextStyle(
                                                  color: Color(0xFF808991),
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              )
                                            ],
                                          ),
                                          10.heightBox,
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/icons/laggage.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              5.widthBox,
                                              Text(
                                                flightDetails['serviceInfo']
                                                        ['legs'][0]['segments']
                                                    [0]['luggage'],
                                                style: const TextStyle(
                                                  color: Color(0xFF808991),
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              )
                                            ],
                                          ),
                                          10.heightBox,
                                        ])
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  flightDetails['serviceInfo']['legs'][0]
                                          ['info']['arrival']['date_time']
                                      .toString()
                                      .split(', ')[1],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: const Color(0xFF808991),
                                    fontSize: 12.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  flightDetails['serviceInfo']['legs'][0]
                                          ['info']['arrival']['date_time']
                                      .toString()
                                      .split(' ')[4],
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: crosscenter,
                                  children: [
                                    Text(
                                      flightDetails['serviceInfo']['legs'][0]
                                              ['info']['arrival']['date_time']
                                          .toString()
                                          .split(', ')[0],
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    MediaQuery.sizeOf(context).width > 410
                                        ? 105.widthBox
                                        : 75.widthBox,
                                    Row(
                                      children: [
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['arrival']
                                                  ['airport']['city']['abb']
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                            .box
                                            .padding(defaultpad)
                                            .roundedSM
                                            .color(Colors.grey.withOpacity(0.2))
                                            .make(),
                                        10.widthBox,
                                        Text(
                                          flightDetails['serviceInfo']['legs']
                                                      [0]['info']['arrival']
                                                  ['airport']['city']['en']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF626262),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                60.heightBox,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              FutureBuilder(
                  future: controller.getFlightsRules(
                      flightDetails['flightBufferReferenceId']),
                  builder: (context, AsyncSnapshot<GetRulesModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                          child: Text("The Flight has no rules "));
                    } else if (snapshot
                        .data!.data.serviceInfo.fareRules.isEmpty) {
                      return const Center(
                          child: Text("The Flight has no rules "));
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot
                            .data!.data.serviceInfo.fareRules[0].details.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(
                              snapshot.data!.data.serviceInfo.fareRules[0]
                                  .details[index].title
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  snapshot.data!.data.serviceInfo.fareRules[0]
                                      .details[index].text
                                      .toString(),
                                  style: TextStyle(
                                    color: const Color(0xFF626262),
                                    fontSize: 12.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          );
                        });
                  }),
            ],
          ),
        ));
  }
}
