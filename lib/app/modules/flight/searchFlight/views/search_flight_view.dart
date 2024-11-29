import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/models/getResponseModel/flight/getAirportmodel.dart';
import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/search_flight_controller.dart';

import 'package:intl/intl.dart';

class SearchFlightView extends StatefulWidget {
  const SearchFlightView({Key? key}) : super(key: key);

  @override
  _SearchFlightViewState createState() => _SearchFlightViewState();
}

class _SearchFlightViewState extends State<SearchFlightView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  final controller = Get.put(SearchFlightController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: pad20,
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
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
                        'Flights',
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
                const SizedBox(
                    height:
                        20), // Add some space between the title and the TabBar
                TabBar(
                  labelStyle: const TextStyle(
                    color: darkBrownColor,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  controller: tabController,
                  tabs: const [
                    Tab(text: 'One-way'),
                    Tab(text: 'Round-Trip'),
                  ],
                  dividerColor: whitecolor,
                  labelColor: const Color(0xFFEC441E), // Selected tab color
                  unselectedLabelColor:
                      Colors.grey[800], // Unselected tab color
                  indicatorColor: const Color(0xFFEC441E),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  Column(
                    children: [
                      10.heightBox,
                      Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          const Text(
                            'Origin',
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
                            Image.asset(
                              airplaneTakeoff,
                              width: 20,
                              height: 20,
                            ),
                            10.widthBox,
                            SizedBox(
                              width: 250.w,
                              child: Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.swipeOneWay.value
                                            ? controller
                                                .selectedDestination.value
                                            : controller.selectedOrigin.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: controller
                                      //       .selectedOrigincode.value,
                                      //   style: const TextStyle(
                                      //     color: Color(0xFF999999),
                                      //     fontSize: 14,
                                      //     fontFamily: 'Poppins',
                                      //     fontWeight: FontWeight.w400,

                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.swipeOneWay.value =
                                    !controller.swipeOneWay.value;
                              },
                              child: Image.asset(
                                "assets/icons/roundtrap.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          const Text(
                            'Destination',
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
                            Image.asset(
                              airplaneLanding,
                              width: 20,
                              height: 20,
                            ),
                            10.widthBox,
                            SizedBox(
                              width: 250.w,
                              child: Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.swipeOneWay.value
                                            ? controller.selectedOrigin.value
                                            : controller
                                                .selectedDestination.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: controller
                                      //       .selectedOrigincode.value,
                                      //   style: const TextStyle(
                                      //     color: Color(0xFF999999),
                                      //     fontSize: 14,
                                      //     fontFamily: 'Poppins',
                                      //     fontWeight: FontWeight.w400,

                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
                            SizedBox(
                              width: 234.w,
                              child: Obx(
                                () => Text(
                                  controller.formatDate(
                                      controller.departureDate.value),
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
                            )
                          ])
                              .box
                              .border(color: blackcolor.withOpacity(0.1))
                              .roundedSM
                              .padding(pad20)
                              .make()
                              .onTap(() {
                            controller.selectDate(context);
                          }),
                          30.heightBox,
                          const Text(
                            'Travellers & cabin class',
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
                                  Image.asset(
                                    "assets/icons/dot.png",
                                    height: 5,
                                    width: 5,
                                  ),
                                  5.widthBox,
                                  Obx(
                                    () => Text(
                                      controller.selectedClass.value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                  5.widthBox,
                                  Image.asset(
                                    "assets/icons/dropdown.png",
                                    height: 10,
                                    width: 10,
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
                              buttonName: "Search Flight",
                              onPressed: () async {
                                controller.getSearchedFlightData(
                                    tabController.index == 0
                                        ? "oneWay"
                                        : "roundTrip");

                                // Get.toNamed(Routes.SEARCH_FLIGHT_RESULTS);
                              },
                              textcolor: whitecolor,
                              loading: false,
                              backgroundColor: Colors.red,
                              rounded: false,
                              height: 40.h,
                              textSize: 15.sp,
                              width: double.infinity)
                        ],
                      ),
                    ],
                  ),
                  // Your One-way content here
                  Column(
                    children: [
                      10.heightBox,
                      Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          const Text(
                            'Origin',
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
                            Image.asset(
                              airplaneTakeoff,
                              width: 20,
                              height: 20,
                            ),
                            10.widthBox,
                            SizedBox(
                              width: 250.w,
                              child: Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.swipeOneWay.value
                                            ? controller
                                                .selectedDestination.value
                                            : controller.selectedOrigin.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: controller
                                      //       .selectedOrigincode.value,
                                      //   style: const TextStyle(
                                      //     color: Color(0xFF999999),
                                      //     fontSize: 14,
                                      //     fontFamily: 'Poppins',
                                      //     fontWeight: FontWeight.w400,

                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.swipeOneWay.value =
                                    !controller.swipeOneWay.value;
                              },
                              child: Image.asset(
                                "assets/icons/roundtrap.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          const Text(
                            'Destination',
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
                            Image.asset(
                              airplaneLanding,
                              width: 20,
                              height: 20,
                            ),
                            10.widthBox,
                            SizedBox(
                              width: 250.w,
                              child: Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.swipeOneWay.value
                                            ? controller.selectedOrigin.value
                                            : controller
                                                .selectedDestination.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: controller
                                      //       .selectedOrigincode.value,
                                      //   style: const TextStyle(
                                      //     color: Color(0xFF999999),
                                      //     fontSize: 14,
                                      //     fontFamily: 'Poppins',
                                      //     fontWeight: FontWeight.w400,

                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
                              minimumDate: DateTime.now()
                                  .subtract(const Duration(days: 2)),
                              maximumDate:
                                  DateTime.now().add(const Duration(days: 30)),
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
                          30.heightBox,
                          const Text(
                            'Travellers & cabin class',
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
                                  Image.asset(
                                    "assets/icons/dot.png",
                                    height: 5,
                                    width: 5,
                                  ),
                                  5.widthBox,
                                  Obx(
                                    () => Text(
                                      controller.selectedClass.value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                  5.widthBox,
                                  Image.asset(
                                    "assets/icons/dropdown.png",
                                    height: 10,
                                    width: 10,
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
                              buttonName: "Search Flight",
                              onPressed: () async {
                                controller.getSearchedFlightData(
                                    tabController.index == 0
                                        ? "oneWay"
                                        : "roundTrip");

                                // Get.toNamed(Routes.SEARCH_FLIGHT_RESULTS);
                              },
                              textcolor: whitecolor,
                              loading: false,
                              backgroundColor: Colors.red,
                              rounded: false,
                              height: 40.h,
                              textSize: 15.sp,
                              width: double.infinity)
                        ],
                      ),
                    ],
                  ),
                  // Your Multicity content here
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class MyPopup extends StatefulWidget {
  final isDestination;

  const MyPopup({super.key, required this.isDestination});

  @override
  State<MyPopup> createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  FlightsRepository flightsRepository = FlightsRepository();

  final searchController = TextEditingController();

  final debounceDuration = const Duration(milliseconds: 500);
  final searchQuery = 'Airports';
  final controller = Get.put(SearchFlightController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        // height: MediaQuery.of(context).size.height / 1.2,
        height: MediaQuery.of(context).size.height * 1.5,
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: "Find a flight",
                hintStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<GetAirports>(
              future: flightsRepository.fetchAirports(
                  searchController.text.isEmpty
                      ? "airport"
                      : searchController.text),
              builder: (context, AsyncSnapshot<GetAirports> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.data.isEmpty) {
                  return const Center(child: Text('No airports found'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {
                              if (widget.isDestination == true) {
                                controller.selectedDestination.value =
                                    snapshot.data!.data[index].title;
                                controller.selectedDestinationCode.value =
                                    snapshot.data!.data[index].id.toString();

                                Get.back();
                              } else {
                                controller.selectedOrigin.value =
                                    snapshot.data!.data[index].title;
                                controller.selectedOrigincode.value =
                                    snapshot.data!.data[index].id.toString();

                                Get.back();
                              }
                            },
                            title: Text(
                              snapshot.data!.data[index].title,
                              style: const TextStyle(
                                color: textfieldgrey,
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ));
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
    // );
  }
}

class SelectAdultsBottomSheet extends StatelessWidget {
  final controller = Get.put(SearchFlightController());

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
      height: MediaQuery.of(context).size.height / 1.2,
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
                    "Infants",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Class",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              buildRadioTile('economy'),
              buildRadioTile('business'),
              buildRadioTile('first class'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildRadioTile(String value) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
        const Spacer(),
        Obx(() => Radio(
              value: value,
              groupValue: controller.selectedClass.value,
              onChanged: (newValue) {
                controller.selectedClass.value = newValue!;
              },
            )),
      ],
    );
  }
}
