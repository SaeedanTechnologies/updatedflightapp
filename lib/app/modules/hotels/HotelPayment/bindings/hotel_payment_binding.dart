import 'package:get/get.dart';

import '../controllers/hotel_payment_controller.dart';

class HotelPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelPaymentController>(
      () => HotelPaymentController(),
    );
  }
}
