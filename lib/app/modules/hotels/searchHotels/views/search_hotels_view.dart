import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getCityModel.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getCountryModel.dart';
import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
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
            Obx(() => Text(
                  controller.selectedNationality.value.isEmpty
                      ? 'Select Country'
                      : controller.selectedNationality.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                )),
          ])
              .box
              .border(color: blackcolor.withOpacity(0.1))
              .roundedSM
              .padding(pad10)
              .make()
              .onTap(() {
            Get.bottomSheet(const MyPopup(
              type: 'country',
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

          30.heightBox,

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
            Obx(() => Text(
                  controller.selectedCity.value.isEmpty
                      ? 'Select City'
                      : controller.selectedCity.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                )),
          ])
              .box
              .border(color: blackcolor.withOpacity(0.1))
              .roundedSM
              .padding(pad10)
              .make()
              .onTap(() {
            Get.bottomSheet(const MyPopup(
              type: 'city',
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
            Get.bottomSheet(
                // SelectAdultsBottomSheet()
                AdultSelectionBottomSheet());
          }),
          20.heightBox,
          CustomButton(
              buttonName: "Search Hotel",
              onPressed: () async {
                controller.getSearchedHotelData();

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
}

class MyPopup extends StatefulWidget {
  final String type; // 'city' or 'country'

  const MyPopup({Key? key, required this.type}) : super(key: key);

  @override
  State<MyPopup> createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  final HotelsRepository hotelRepository = HotelsRepository();
  final searchController = TextEditingController();
  final SearchHotelsController controller =
      Get.put(SearchHotelsController()); // GetX controller

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                hintText:
                    "Search ${widget.type == 'city' ? 'City' : 'Country'}",
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: widget.type == 'city'
                  ? hotelRepository.fetchCities(searchController.text)
                  : hotelRepository.fetchCountries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final data = widget.type == 'city'
                      ? (snapshot.data as GetCities).data
                      : snapshot.data as List<CountryData>;

                  if (data.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];

                        if (widget.type == 'city') {
                          final city = item as CityData;
                          return ListTile(
                            onTap: () {
                              controller.selectedCity.value = city.title;
                              Get.back();
                            },
                            title: Text(city.title),
                          );
                        } else if (widget.type == 'country') {
                          final country = item as CountryData;
                          return ListTile(
                            onTap: () {
                              controller.selectedNationality.value =
                                  country.title;
                              Get.back();
                            },
                            title: Text(country.title),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdultSelectionBottomSheet extends StatelessWidget {
  final SearchHotelsController controller = Get.put(SearchHotelsController());

  AdultSelectionBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children:
                        List.generate(controller.rooms.length, (roomIndex) {
                      final room = controller.rooms[roomIndex];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Room Header with Remove Icon
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Room ${roomIndex + 1}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.red),
                                    onPressed: () =>
                                        controller.removeRoom(roomIndex),
                                  ),
                                ],
                              ),
                              const Divider(),
                              // Adults Row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Adults",
                                      style: TextStyle(fontSize: 16)),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove,
                                            color: primaycolor),
                                        onPressed: () {
                                          if (controller.selectedAdults.value >
                                              0) {
                                            controller.selectedAdults.value--;
                                            controller
                                                .selectedTravelers.value--;
                                          }
                                        },
                                      ),
                                      Obx(() => Text(controller
                                          .selectedAdults.value
                                          .toString())),
                                      IconButton(
                                          icon: const Icon(Icons.add,
                                              color: primaycolor),
                                          onPressed: () {
                                            controller.selectedAdults.value++;
                                            controller
                                                .selectedTravelers.value++;
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              // Children Row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Children",
                                      style: TextStyle(fontSize: 16)),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove,
                                            color: primaycolor),
                                        onPressed: () {
                                          if (controller.selectedAdults.value >
                                              0) {
                                            controller.selectedChildren.value--;
                                            controller
                                                .selectedTravelers.value--;
                                            controller
                                                .rooms[roomIndex].childAges
                                                .removeLast();
                                          }
                                        },
                                      ),
                                      Obx(() => Text(controller
                                          .selectedChildren.value
                                          .toString())),
                                      IconButton(
                                        icon: const Icon(Icons.add,
                                            color: primaycolor),
                                        onPressed: () {
                                          controller.selectedChildren.value++;
                                          controller.selectedTravelers.value++;
                                          controller.rooms[roomIndex].childAges
                                              .add(1);
                                          // controller.childAges.add(index++);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              // Dynamic Child Ages
                              Obx(() {
                                return Column(
                                  children: List.generate(room.childAges.length,
                                      (index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Child Age ${index + 1}",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove,
                                                  color: primaycolor),
                                              onPressed: () =>
                                                  room.decrementChildAge(index),
                                            ),
                                            Text(room.childAges[index]
                                                .toString()),
                                            IconButton(
                                              icon: const Icon(Icons.add,
                                                  color: primaycolor),
                                              onPressed: () =>
                                                  room.incrementChildAge(index),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
            // Add Another Room Button
            Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                onPressed: controller.addRoom,
                icon: const Icon(Icons.add, color: primaycolor),
                label: const Text("Add another room"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaycolor,
                  side: const BorderSide(color: primaycolor),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Done Button
            ElevatedButton(
              onPressed: () {
                // Implement Done functionality
              },
              child: const Text("Done"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaycolor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
