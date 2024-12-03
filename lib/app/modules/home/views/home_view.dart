import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/icons.dart';
import 'package:flightbooking/app/resources/images.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/resources/physics.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: pad18,
        children: [
          Row(
            mainAxisAlignment: mainbetween,
            children: [
              Column(
                crossAxisAlignment: crosstart,
                children: [
                  Text(
                    "Start Your Journey",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  5.heightBox,
                  Text(
                    "Compare hundred of travel websites at once.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: textfieldgrey),
                  ),
                ],
              ),
              Image.asset(
                notification,
                width: 30,
                height: 30,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 15.r,
                    backgroundImage: const AssetImage(profilepicture),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 10.sp),
                  )
                ],
              )
            ],
          ),
          20.heightBox,
          SizedBox(
            height: 40.h,
            width: 70.w,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Row(
                      children: [
                        Image.asset(
                          index == 0
                              ? "assets/icons/aeroplane.png"
                              : index == 1
                                  ? "assets/icons/hotels.png"
                                  : index == 2
                                      ? "assets/icons/packages.png"
                                      : "assets/icons/visas.png",
                          width: 30,
                          height: 30,
                          color: controller.selectedIndex.value == index
                              ? whitecolor
                              : blackcolor,
                        ),
                        Text(
                          index == 0
                              ? 'Flights'
                              : index == 1
                                  ? "Hotels"
                                  : index == 2
                                      ? "Packages"
                                      : "Visas",
                          style: TextStyle(
                              color: controller.selectedIndex.value == index
                                  ? whitecolor
                                  : blackcolor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        5.widthBox,
                      ],
                    )
                        .box
                        .rounded
                        .color(controller.selectedIndex.value == index
                            ? primaycolor
                            : textfieldgrey.withOpacity(0.2))
                        .padding(defaultpad)
                        .margin(defaultpad)
                        .make()
                        .onTap(() {
                      controller.selectedIndex.value = index;
                    }),
                  );
                }),
          ),
          20.heightBox,
          Obx(() => TextField(
                onTap: () {
                  if (controller.selectedIndex.value == 0) {
                    Get.toNamed(Routes.SEARCH_FLIGHT);
                  } else if (controller.selectedIndex.value == 1) {
                    Get.toNamed(Routes.SEARCH_HOTELS);
                  } else if (controller.selectedIndex.value == 2) {
                    Get.toNamed(Routes.PACKAGE);
                  } else if (controller.selectedIndex.value == 3) {
                    Get.toNamed(Routes.VISA);
                  }
                },
                readOnly: true,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textfieldgrey),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                            color: greyColor.withOpacity(0.5), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide:
                            BorderSide(color: greyColor.withOpacity(0.5))),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide:
                            BorderSide(color: greyColor.withOpacity(0.5))),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: controller.selectedIndex.value == 0
                        ? "Find a flight"
                        : controller.selectedIndex.value == 1
                            ? "Find Hotels"
                            : controller.selectedIndex.value == 2
                                ? "Find packages"
                                : "Find Visas",
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: textfieldgrey,
                    )),
              )),
          20.heightBox,
          Obx(() => controller.selectedIndex.value == 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Popluar Flights",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  color: primaycolor, fontSize: 16.sp),
                            ))
                      ],
                    ),
                    20.heightBox,
                    FutureBuilder(
                        future: controller.getpopularFlights(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    2, // Change this according to your needs
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(0.5),
                                    highlightColor:
                                        Colors.grey.withOpacity(0.6),
                                    child: const ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 30,
                                      ),
                                      title: Text('Loading...'),
                                      subtitle: Text('Loading...'),
                                    ),
                                  );
                                });
                          }

                          return SizedBox(
                            height: 300.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data['data'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: defaultpad,
                                  child: Column(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      const Text(
                                        'From',
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
                                          width: 30,
                                          height: 30,
                                        ),
                                        10.widthBox,
                                        Column(
                                          crossAxisAlignment: crosstart,
                                          mainAxisAlignment: mainbetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data['data'][index]
                                                      ['origin']['city_en'],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.09,
                                                  ),
                                                ),
                                                10.widthBox,
                                                Text(
                                                  snapshot.data['data'][index]
                                                      ['origin']['city_abb'],
                                                  style: const TextStyle(
                                                    color: Color(0xFF555555),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.14,
                                                  ),
                                                )
                                              ],
                                            ),
                                            10.heightBox,
                                            SizedBox(
                                              width: 208,
                                              child: Text(
                                                snapshot.data['data'][index]
                                                        ['origin']
                                                    ['airport_buffer_title'],
                                                style: const TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ])
                                          .box
                                          .border(
                                              color: greyColor.withOpacity(0.5))
                                          .roundedSM
                                          .padding(defaultpad)
                                          .make(),
                                      20.heightBox,
                                      const Text(
                                        'To',
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
                                          width: 30,
                                          height: 30,
                                        ),
                                        10.widthBox,
                                        Column(
                                          crossAxisAlignment: crosstart,
                                          mainAxisAlignment: mainbetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data['data'][index]
                                                          ['destination']
                                                      ['city_en'],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.09,
                                                  ),
                                                ),
                                                10.widthBox,
                                                Text(
                                                  snapshot.data['data'][index]
                                                          ['destination']
                                                      ['city_abb'],
                                                  style: const TextStyle(
                                                    color: Color(0xFF555555),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            10.heightBox,
                                            SizedBox(
                                              width: 208,
                                              child: Text(
                                                snapshot.data['data'][index]
                                                        ['destination']
                                                    ['airport_buffer_title'],
                                                style: const TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ])
                                          .box
                                          .border(
                                              color: greyColor.withOpacity(0.5))
                                          .roundedSM
                                          .padding(defaultpad)
                                          .make(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        })
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: crosstart,
                    children: [
                      const Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          Text(
                            'Popular Hotels',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            'See all',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFEC441E),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                      20.heightBox,
                      FutureBuilder(
                          future: controller.getPopularDestinations(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: SizedBox.shrink(),
                              );
                            } else if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox.shrink(),
                              );
                            }
                            return SizedBox(
                              height: 220.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 185.w,
                                      height: 250.h,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/hotel1.png")),
                                        color: Colors.black
                                            .withOpacity(0.4099999964237213),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: whitecolor,
                                                    size: 15.sp,
                                                  ),
                                                  Text(
                                                    '4,7',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0.10,
                                                    ),
                                                  )
                                                ],
                                              )
                                                  .box
                                                  .padding(
                                                      const EdgeInsets.fromLTRB(
                                                          5, 2, 5, 2))
                                                  .color(Colors.red)
                                                  .roundedSM
                                                  .make(),
                                            ),
                                            const Spacer(),
                                            const Text(
                                              'Emeralda Hotel',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0.09,
                                              ),
                                            ),
                                            10.heightBox,
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_pin,
                                                  color: whitecolor,
                                                  size: 14.sp,
                                                ),
                                                const Text(
                                                  'Lahore, Pakistan',
                                                  style: TextStyle(
                                                    color: Color(0xFFDDDDDD),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0.12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment: mainbetween,
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                      '\$30',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 0.09,
                                                      ),
                                                    ),
                                                    Text(
                                                      '/per night',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFDDDDDD),
                                                        fontSize: 11,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  "assets/images/booking.png",
                                                  height: 20,
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                            20.heightBox,
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          const Text(
                            'Recently Booked',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.RECENTLY_BOOKED);
                            },
                            child: const Text(
                              'See all',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFEC441E),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.12,
                              ),
                            ),
                          )
                        ],
                      ),
                      ListView.builder(
                          physics: neverscroll,
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 72,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/hotel2.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    ),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment: crosstart,
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        const Text(
                                          'PC Hotel',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: blackcolor,
                                              size: 12.sp,
                                            ),
                                            const Text(
                                              'Lahore, Pakistan',
                                              style: TextStyle(
                                                color: Color(0xFF8B8B8B),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        20.heightBox,
                                        const Row(
                                          children: [
                                            Text(
                                              '\$30',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0.09,
                                              ),
                                            ),
                                            Text(
                                              '/per night',
                                              style: TextStyle(
                                                color: Color(0xFF626262),
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.13,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: crossend,
                                  mainAxisAlignment: mainbetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: const Color(
                                            0xffFFD300,
                                          ),
                                          size: 20.sp,
                                        ),
                                        const Text(
                                          '4,7',
                                          style: TextStyle(
                                            color: Color(0xFFEC441E),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    10.heightBox,
                                    const Text(
                                      '(4,594 reviews)',
                                      style: TextStyle(
                                        color: Color(0xFF22313F),
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0.13,
                                      ),
                                    ),
                                    20.heightBox,
                                    Image.asset(
                                      "assets/images/booking.png",
                                      width: 20,
                                      height: 20,
                                    )
                                  ],
                                )
                              ],
                            )
                                .box
                                .color(const Color(0x99F4F4F4))
                                .padding(pad14)
                                .rounded
                                .margin(const EdgeInsets.only(top: 10))
                                .make();
                          })
                    ],
                  ),
                ))
        ],
      ),
    ));
  }
}
