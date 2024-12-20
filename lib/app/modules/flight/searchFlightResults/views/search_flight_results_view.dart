import 'package:flightbooking/app/modules/flight/searchFlight/controllers/search_flight_controller.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/search_flight_results_controller.dart';

class SearchFlightResultsView extends GetView<SearchFlightResultsController> {
  const SearchFlightResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SearchFlightController());

    var flightsData = Get.arguments[0];
    final tripType = Get.arguments[1];

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: pad18,
        child: Column(crossAxisAlignment: crosstart, children: [
          Row(
            children: [
              Image.asset(
                backarrow,
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ).onTap(() {
                Get.back();
              }),
              10.widthBox,
              Column(
                crossAxisAlignment: crosstart,
                mainAxisAlignment: maincenter,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          flightsData['data'].length > 0
                              ? flightsData['data'][0]['serviceInfo']['legs'][0]
                                      ['info']['departure']['city']
                                  .toString()
                              : controllers.selectedOrigin.value.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      10.widthBox,
                      Image.asset(
                        "assets/icons/forwardarrow.png",
                        height: 15,
                        width: 15,
                      ),
                      10.widthBox,
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          flightsData['data'].length > 0
                              ? flightsData['data'][0]['serviceInfo']['legs'][0]
                                      ['info']['arrival']['city']
                                  .toString()
                              : controllers.selectedDestination.value
                                  .toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      tripType == "oneWay"
                          ? Text(
                              controller.formatDate(
                                  controllers.departureDate.value.toString()),
                              style: TextStyle(
                                color: const Color(0xFF626262),
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : const SizedBox.shrink(),
                      tripType == "roundTrip"
                          ? Text(
                              controller.formatDate(
                                  controllers.startDate.value.toString()),
                              style: TextStyle(
                                color: const Color(0xFF626262),
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : const SizedBox.shrink(),
                      tripType == "roundTrip"
                          ? 5.widthBox
                          : const SizedBox.shrink(),
                      tripType == "roundTrip"
                          ? Container(
                              height: 1,
                              width: 7,
                              color: darkgreyColor,
                            )
                          : const SizedBox.shrink(),
                      tripType == "roundTrip"
                          ? 5.widthBox
                          : const SizedBox.shrink(),
                      tripType == "roundTrip"
                          ? Text(
                              controller.formatDate(
                                  controllers.endDate.value.toString()),
                              style: TextStyle(
                                color: const Color(0xFF626262),
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: const Color(0xFF626262),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        controllers.selectedClass.value,
                        style: TextStyle(
                          color: const Color(0xFF626262),
                          fontSize: 9.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: const Color(0xFF626262),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${controllers.selectedTravelers.value} Traveler',
                        style: TextStyle(
                          color: const Color(0xFF626262),
                          fontSize: 9.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          // FutureBuilder(
          //     future: controller.getSearchedFlightData(),
          //     builder: ((context, AsyncSnapshot snapshot) {
          //       if (!snapshot.hasData) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else if (snapshot.hasError) {
          //         return Center(
          //           child: Utils.snakbar(
          //               title: "Error", body: "${snapshot.error}"),
          //         );
          //       } else if (snapshot.connectionState ==
          //           ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         return
          Divider(
            color: greyColor.withOpacity(0.5),
          ),
          SizedBox(
              height: 50.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          index == 0
                              ? const Text(
                                  'Filter',
                                  style: TextStyle(
                                    color: Color(0xFFACACAC),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              : index == 1
                                  ? const Text(
                                      'Sory By : Suggestion',
                                      style: TextStyle(
                                        color: Color(0xFFACACAC),
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    )
                                  : const Text(
                                      'Stop Count',
                                      style: TextStyle(
                                        color: Color(0xFFACACAC),
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                          10.widthBox,
                          Image.asset(
                            "assets/icons/filter.png",
                            height: 30.h,
                            width: 20.w,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    )
                        .box
                        .padding(const EdgeInsets.only(
                            top: 12, bottom: 12, right: 20, left: 20))
                        .margin(defaultpad)
                        .border(color: greyColor.withOpacity(0.5))
                        .roundedSM
                        .make()
                        .onTap(() {
                      Get.bottomSheet(FullScreenBottomSheet(),
                          isScrollControlled: true);
                    });
                  })),
          Divider(
            color: greyColor.withOpacity(0.5),
          ),
          10.heightBox,
          SizedBox(
            width: 299,
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Direct Flights',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 35,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0x7FFFCEC3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Recommended',
                        style: TextStyle(
                          color: Color(0xFFEC441E),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.heightBox,
          flightsData['data'].length > 0
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: flightsData['data'].length,
                      itemBuilder: (contxt, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                FutureBuilder<Widget>(
                                  future: controller.fetchflightLogo(
                                      flightsData['data'][index]['serviceInfo']
                                              ['legs'][0]['info']['airline']
                                          ['logo']),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return snapshot.data ??
                                          const Text('No Image');
                                    }
                                  },
                                ),
                                5.widthBox,
                                Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    SizedBox(
                                      width: 56,
                                      child: Text(
                                        flightsData['data'][index]
                                                ['serviceInfo']['legs'][0]
                                            ['info']['departure']['time'],
                                        style: TextStyle(
                                          color: const Color(0xFF191919),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      flightsData['data'][index]['serviceInfo']
                                                  ['legs'][0]['info']
                                              ['departure']['city']
                                          .toString(),
                                      style: TextStyle(
                                        color: const Color(0xFF191919),
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      flightsData['data'][index]['serviceInfo']
                                              ['legs'][0]['info']['duration']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/icons/searchfligts.png",
                                      height: 17,
                                      width: 90.w,
                                    ),
                                    const Text(
                                      'Direct',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                10.widthBox,
                                Column(
                                  crossAxisAlignment: crossend,
                                  children: [
                                    SizedBox(
                                      width: 56,
                                      child: Text(
                                        flightsData['data'][index]
                                                    ['serviceInfo']['legs'][0]
                                                ['info']['arrival']['time']
                                            .toString(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: const Color(0xFF191919),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          height: 0.06,
                                        ),
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      flightsData['data'][index]['serviceInfo']
                                                  ['legs'][0]['info']['arrival']
                                              ['city']
                                          .toString(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: const Color(0xFF191919),
                                        fontSize: 12.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                5.widthBox,
                              ],
                            ),
                            10.heightBox,
                            Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      flightsData['data'][index]['serviceInfo']
                                                  ['legs'][0]['segments'][0]
                                              ['operatingAirline']['title']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    10.widthBox,
                                    Image.asset(
                                      "assets/icons/dot.png",
                                      height: 5,
                                      width: 5,
                                    ),
                                    5.widthBox,
                                    Text(
                                      flightsData['data'][index]['serviceInfo']
                                                  ['legs'][0]['segments'][0]
                                              ['flight_number']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF626262),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: mainstart,
                                  children: [
                                    Image.asset(
                                      "assets/icons/laggage.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    5.widthBox,
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        flightsData['data'][index]
                                                    ['serviceInfo']['legs'][0]
                                                ['segments'][0]['luggage']
                                            .toString(),
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Color(0xFF626262),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            tripType == "roundTrip"
                                ? Column(children: [
                                    15.heightBox,
                                    Image.asset(
                                      "assets/icons/dotedline.png",
                                      height: 10,
                                      width: double.infinity,
                                    ),
                                    15.heightBox,
                                    Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        FutureBuilder<Widget>(
                                          future: controller.fetchflightLogo(
                                              flightsData['data'][index]
                                                      ['serviceInfo']['legs'][1]
                                                  ['info']['airline']['logo']),
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
                                        5.widthBox,
                                        Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            SizedBox(
                                              width: 56,
                                              child: Text(
                                                flightsData['data'][index]
                                                                ['serviceInfo']
                                                            ['legs'][1]['info']
                                                        ['arrival']['time']
                                                    .toString(),
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF191919),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              flightsData['data'][index]
                                                              ['serviceInfo']
                                                          ['legs'][1]['info']
                                                      ['arrival']['city']
                                                  .toString(),
                                              style: TextStyle(
                                                color: const Color(0xFF191919),
                                                fontSize: 12.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              flightsData['data'][index]
                                                              ['serviceInfo']
                                                          ['legs'][1]['info']
                                                      ['duration']
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/icons/returnflight.png",
                                              height: 17,
                                              width: 90,
                                            ),
                                            const Text(
                                              'Direct',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                        10.widthBox,
                                        Column(
                                          crossAxisAlignment: crossend,
                                          children: [
                                            SizedBox(
                                              width: 56,
                                              child: Text(
                                                flightsData['data'][index]
                                                                ['serviceInfo']
                                                            ['legs'][1]['info']
                                                        ['departure']['time']
                                                    .toString(),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF191919),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.06,
                                                ),
                                              ),
                                            ),
                                            10.heightBox,
                                            Text(
                                              flightsData['data'][index]
                                                              ['serviceInfo'][
                                                          'legs'][0]['segments']
                                                      [0]['arrival']['city']
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(0xFF191919),
                                                fontSize: 12.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    10.heightBox,
                                    Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              flightsData['data'][index][
                                                                  'serviceInfo']
                                                              ['legs'][1]
                                                          ['segments'][0][
                                                      'operatingAirline']['title']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            10.widthBox,
                                            Image.asset(
                                              "assets/icons/dot.png",
                                              height: 5,
                                              width: 5,
                                            ),
                                            5.widthBox,
                                            Text(
                                              flightsData['data'][index]
                                                              ['serviceInfo'][
                                                          'legs'][1]['segments']
                                                      [0]['flight_number']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/laggage.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            5.widthBox,
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                flightsData['data'][index]
                                                                ['serviceInfo']
                                                            ['legs'][1][
                                                        'segments'][0]['luggage']
                                                    .toString(),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  color: Color(0xFF626262),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ])
                                : const SizedBox.shrink(),
                            15.heightBox,
                            Image.asset(
                              "assets/icons/dotedline.png",
                              height: 10,
                              width: double.infinity,
                            ),
                            15.heightBox,
                            Row(
                              mainAxisAlignment: mainend,
                              children: [
                                Text(
                                  'For ${controllers.selectedTravelers.value} People :',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Color(0xFF626262),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                5.widthBox,
                                Text(
                                  '${flightsData['data'][index]['priceInfo']['currency']['symbol']} ${flightsData['data'][index]['priceInfo']['baseFare'].toString()}',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                            .box
                            .white
                            .padding(pad18)
                            .color(const Color(0xFFF9FBFA))
                            .margin(const EdgeInsets.fromLTRB(3, 5, 3, 5))
                            .roundedSM
                            .outerShadow
                            .make()
                            .onTap(() {
                          print(
                              " helooooooooooooooooooooooooo  ${flightsData['data'][index]}");
                          Get.toNamed(Routes.FLIGHT_DETAILS, arguments: [
                            flightsData['data'][index],
                            tripType
                          ]);
                        });
                      }),
                )
              //           }
              //         })),
              //   ],
              : Center(
                  child: Column(
                  mainAxisAlignment: maincenter,
                  children: [
                    100.heightBox,
                    Text(
                      "Flights not found",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    10.heightBox,
                    Image.asset("assets/icons/no-flight.png",
                        width: 100.w, height: 100.h),
                  ],
                ))
        ]),
      ),
    ));
  }
}

// ignore: must_be_immutable
class FullScreenBottomSheet extends StatelessWidget {
  var controller = Get.put<SearchFlightResultsController>(
    SearchFlightResultsController(),
  );

  FullScreenBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: pad12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: mainbetween,
                children: [
                  const Text(
                    'Remove all',
                    style: TextStyle(
                      color: Color(0xFF626262),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.19,
                    ),
                  ),
                  const Text(
                    'Sort & Filters',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.08,
                    ),
                  ),
                  Image.asset(
                    "assets/icons/cancelicon.png",
                    height: 20,
                    width: 20,
                  )
                ],
              ),
              5.heightBox,
              Divider(
                color: greyColor.withOpacity(0.5),
              ),
              10.heightBox,
              const Text(
                'Departure Date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/earlymorning.png",
                            height: 30,
                            width: 30,
                          ),
                          10.widthBox,
                          Column(
                            children: [
                              const Text(
                                'Early Morning',
                                style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              10.heightBox,
                              const Text(
                                '00 : 00 - 04 : ...',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                      .box
                      .border(color: greyColor.withOpacity(0.5))
                      .roundedSM
                      .padding(defaultpad)
                      .make(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/morning.png",
                            height: 30,
                            width: 30,
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              const Text(
                                'Morning',
                                style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              10.heightBox,
                              const Text(
                                '05 : 00 - 11 - 59',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                      .box
                      .border(color: greyColor.withOpacity(0.5))
                      .roundedSM
                      .padding(defaultpad)
                      .make()
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/earlymorning.png",
                            height: 30,
                            width: 30,
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              const Text(
                                'Evening',
                                style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              10.heightBox,
                              const Text(
                                '12 : 00 - 17 : 59',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                      .box
                      .border(color: greyColor.withOpacity(0.5))
                      .roundedSM
                      .padding(defaultpad)
                      .make(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/night.png",
                            height: 30,
                            width: 30,
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              const Text(
                                'Night',
                                style: TextStyle(
                                  color: Color(0xFFACACAC),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              10.heightBox,
                              const Text(
                                '18 : 00 - 23 : 59',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                      .box
                      .border(color: greyColor.withOpacity(0.5))
                      .roundedSM
                      .padding(defaultpad)
                      .make()
                ],
              ),
              10.heightBox,
              Divider(
                color: greyColor.withOpacity(0.5),
              ),
              10.heightBox,
              const Text(
                'Stop Count',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
              Obx(() => CheckboxListTile(
                    contentPadding:
                        EdgeInsets.zero, // Set contentPadding to zero
                    dense: true, // Set dense to true to reduce vertical padding
                    title: const Text(
                      'Direct',
                      style: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    value: controller.selectedStop.value == 'Direct',
                    activeColor: Colors.red,
                    onChanged: (newValue) {
                      if (newValue!) {
                        controller.setSelectedStop('Direct');
                      } else {
                        controller.setSelectedStop('');
                      }
                    },
                  )),
              Obx(() => CheckboxListTile(
                    contentPadding:
                        EdgeInsets.zero, // Set contentPadding to zero
                    dense: true, // Set dense to true to reduce vertical padding
                    title: const Text(
                      '1 Stop',
                      style: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    value: controller.selectedStop.value == '1 Stop',
                    activeColor: Colors.red,
                    onChanged: (newValue) {
                      if (newValue!) {
                        controller.setSelectedStop('1 Stop');
                      } else {
                        controller.setSelectedStop('');
                      }
                    },
                  )),
              Obx(() => CheckboxListTile(
                    contentPadding:
                        EdgeInsets.zero, // Set contentPadding to zero
                    dense: true, // Set dense to true to reduce vertical padding
                    title: const Text(
                      '2 or more Stops',
                      style: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    value: controller.selectedStop.value == '2 or more Stops',
                    activeColor: Colors.red,
                    onChanged: (newValue) {
                      if (newValue!) {
                        controller.setSelectedStop('2 or more Stops');
                      } else {
                        controller.setSelectedStop('');
                      }
                    },
                  )),
              Divider(
                color: greyColor.withOpacity(0.5),
              ),
              10.heightBox,
              const Text(
                'Maximum Price Duration',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
              30.heightBox,
              Center(
                child: Obx(
                  () => Text(
                    controller.price.value.toString(),
                    style: const TextStyle(
                      color: Color(0xFF626262),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.12,
                    ),
                  ),
                ),
              ),
              Obx(() => Slider(
                    value: controller.price.value,
                    min: 466,
                    max: 3199,
                    divisions: 2733,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey[300],
                    thumbColor: whitecolor,
                    onChanged: (newValue) {
                      controller.setPrice(newValue);
                    },
                  )),
              Divider(
                color: greyColor.withOpacity(0.5),
              ),
              10.heightBox,
              const Text(
                'Airlines',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
              10.heightBox,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.filteredData.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            activeColor: Colors.red,
                            value: controller.selectedFlight.value ==
                                controller.flightCompanies[index],
                            onChanged: (isChecked) {
                              controller.selectFlight(isChecked!
                                  ? controller.flightCompanies[index]
                                  : '');
                            },
                          ),
                        ),
                        FutureBuilder<Widget>(
                          future: controller.fetchflightLogo(
                              controller.filteredData[index]['serviceInfo']
                                  ['legs'][0]['info']['airline']['logo']),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return snapshot.data ?? const Text('No Image');
                            }
                          },
                        ),
                        50.widthBox,
                        Text(
                          controller.filteredData[index]['serviceInfo']['legs']
                              [0]['info']['airline']['en'],
                          style: const TextStyle(
                            color: Color(0xFF626262),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
