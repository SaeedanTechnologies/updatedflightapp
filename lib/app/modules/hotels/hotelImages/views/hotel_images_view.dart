import 'package:flightbooking/app/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/hotel_images_controller.dart';

class HotelImagesView extends GetView<HotelImagesController> {
  const HotelImagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    backarrow,
                    width: 30,
                    height: 30,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Gallery Hotel Photoes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const Spacer(),
              ],
            ),
            10.heightBox,
            Expanded(
              child: GridView.builder(
                  itemCount: controller.items.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Image.network(
                      controller.items[index],
                      fit: BoxFit.cover,
                    )
                        .box
                        .width(180.w)
                        .color(const Color(0xffF3F3F3))
                        .clip(Clip.antiAlias)
                        .rounded
                        .outerShadow
                        .make();
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
