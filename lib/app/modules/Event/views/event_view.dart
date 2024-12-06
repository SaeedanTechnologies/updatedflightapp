import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getCityModel.dart';

import 'package:flightbooking/app/models/getResponseModel/hotels/getCountryModel.dart';
import 'package:flightbooking/app/modules/Event/controllers/event_controller.dart';
import 'package:flightbooking/app/modules/Tour/controllers/tour_controller.dart';
import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                  'Events',
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
            'Event city',
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
                      ? 'Select City for events'
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
                  controller.formatDate(controller.departureDate.value),
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
          50.heightBox,
          CustomButton(
              buttonName: "Search Events",
              onPressed: () async {},
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

  final TourController tourController = Get.put(TourController());
  // final SearchHotelsController controller =
  //     Get.put(SearchHotelsController()); // GetX controller

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
                              tourController.selectedCity.value = city.title;
                              Get.back();
                            },
                            title: Text(city.title),
                          );
                        } else if (widget.type == 'country') {
                          final country = item as CountryData;
                          return ListTile(
                            onTap: () {
                              tourController.selectedNationality.value =
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
