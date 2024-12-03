import 'package:flightbooking/app/commonWidgtes/customelevatedButton.dart';
import 'package:flightbooking/app/resources/alignments.dart';
import 'package:flightbooking/app/resources/colors.dart';
import 'package:flightbooking/app/resources/paddings.dart';
import 'package:flightbooking/app/resources/physics.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/hotel_details_controller.dart';

class HotelDetailsView extends GetView<HotelDetailsController> {
  const HotelDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(mainAxisAlignment: mainaround, children: [
              const Row(
                children: [
                  Text(
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
                    '\$30',
                    style: TextStyle(
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
                  buttonName: "Book Now",
                  onPressed: () {
                    Get.toNamed(Routes.HOTEL_RESERVATION);
                  },
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: Colors.red,
                  rounded: true,
                  height: 40.h,
                  textSize: 18.sp,
                  width: 200.w),
            ])),
        body: ListView(
          children: [
            // Assuming you have a CarouselController named controller for your CarouselSlider

            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 230.0,
            //     viewportFraction: 1,
            //     autoPlay: true,
            //     onPageChanged: controller.onPageChanged,
            //   ),
            //   items: controller.items.map((index) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //           height: MediaQuery.of(context).size.height,
            //           width: MediaQuery.of(context).size.width,
            //           decoration: BoxDecoration(
            //             color: Colors.amber,
            //             image: DecorationImage(
            //               image: NetworkImage(index),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const Spacer(),
            //               Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: GestureDetector(
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(left: 14),
            //                     child: Image.asset(
            //                       backarrow,
            //                       width: 40,
            //                       height: 40,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               const Spacer(),
            //               Obx(() => DotsIndicator(
            //                     dotsCount: controller.items.length,
            //                     position: controller.currentSlide.value,
            //                     decorator: DotsDecorator(
            //                       size: const Size.square(9.0),
            //                       activeSize: const Size(18.0, 9.0),
            //                       activeColor: Colors.red,
            //                       color: whitecolor,
            //                       activeShape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(5.0)),
            //                     ),
            //                   )),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   }).toList(),
            // ),
            20.heightBox,
            Padding(
              padding: defaultpad,
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  const Text(
                    'Full Furnish House',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                    ),
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/locationpin.png",
                        width: 15,
                        height: 20,
                      ),
                      10.widthBox,
                      const Text(
                        'Bahira Town, Lahore',
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            10.heightBox,
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
            ),
            20.heightBox,
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.detailsIcon.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: maincenter,
                      children: [
                        Image.asset(
                          controller.detailsIcon[index],
                          height: 20,
                          width: 20,
                        ),
                        10.heightBox,
                        Text(
                          controller.detailsNames[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        )
                      ],
                    )
                        .box
                        .roundedSM
                        .width(80.w)
                        .color(const Color(0xffF3F3F3))
                        .padding(pad12)
                        .margin(const EdgeInsets.only(right: 5, left: 5))
                        .outerShadow
                        .make();
                  }),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  const Text(
                    'Gallery Photos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.HOTEL_IMAGES);
                    },
                    child: const Text(
                      'See all',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFEC441E),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 170.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.detailsIcon.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      controller.items[index],
                      fit: BoxFit.cover,
                    )
                        .box
                        .width(150.w)
                        .color(const Color(0xffF3F3F3))
                        .clip(Clip.antiAlias)
                        .rounded
                        .margin(pad10)
                        .outerShadow
                        .make();
                  }),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  10.heightBox,
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem ',
                          style: TextStyle(
                            color: Color(0xFF626262),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Read More ...',
                          style: TextStyle(
                            color: Color(0xFFEC441E),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            20.heightBox,
            SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.facilitiesIcons1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: maincenter,
                      children: [
                        Image.asset(
                          controller.facilitiesIcons1[index],
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          controller.facilitiesNames1[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                        .box
                        .roundedSM
                        .width(80.w)
                        .color(const Color(0xffF3F3F3))
                        .padding(pad12)
                        .margin(const EdgeInsets.only(right: 5, left: 5))
                        .outerShadow
                        .make();
                  }),
            ),
            10.heightBox,
            SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.facilitiesIcons2.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: maincenter,
                      children: [
                        Image.asset(
                          controller.facilitiesIcons2[index],
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          controller.facilitiesNames2[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                        .box
                        .roundedSM
                        .width(80.w)
                        .color(const Color(0xffF3F3F3))
                        .padding(pad12)
                        .margin(const EdgeInsets.only(right: 5, left: 5))
                        .outerShadow
                        .make();
                  }),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Review',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                        ),
                      ),
                      10.widthBox,
                      Icon(
                        Icons.star,
                        color: ratingcolor,
                        size: 19.sp,
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
                      5.widthBox,
                      const Text(
                        '(4,594 reviews)',
                        style: TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.13,
                        ),
                      )
                    ],
                  ),
                  const Text(
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
            ),
            20.heightBox,
            ListView.builder(
                physics: neverscroll,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: crosscenter,
                          children: [
                            Image.asset(
                              "assets/images/hotel1.png",
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ).box.clip(Clip.antiAlias).roundedSM.make(),
                            10.widthBox,
                            Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                const Text(
                                  'Hamza Yasin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                10.heightBox,
                                const Text(
                                  'Dec 10, 2024',
                                  style: TextStyle(
                                    color: Color(0xFF626262),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.12,
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
                            SizedBox(
                              width: 280.w,
                              child: const Text(
                                'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor sit amet consectetur.',
                                style: TextStyle(
                                  color: Color(0xFF626262),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: whitecolor,
                                ),
                                const Text(
                                  '4,7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.10,
                                  ),
                                )
                              ],
                            )
                                .box
                                .roundedSM
                                .color(Colors.red)
                                .padding(defaultpad)
                                .make()
                          ],
                        ),
                        20.heightBox,
                      ],
                    ),
                  );
                }),
            40.heightBox,
          ],
        ));
  }
}
