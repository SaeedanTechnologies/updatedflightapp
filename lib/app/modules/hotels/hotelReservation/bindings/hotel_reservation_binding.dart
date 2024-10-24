import 'package:get/get.dart';

import '../controllers/hotel_reservation_controller.dart';

class HotelReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelReservationController>(
      () => HotelReservationController(),
    );
  }
}
