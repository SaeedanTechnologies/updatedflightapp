import 'package:get/get.dart';

import '../controllers/hotel_images_controller.dart';

class HotelImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelImagesController>(
      () => HotelImagesController(),
    );
  }
}
