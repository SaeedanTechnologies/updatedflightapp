import 'package:get/get.dart';

import '../controllers/hotel_reservation_information_controller.dart';

class HotelReservationInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelReservationInformationController>(
      () => HotelReservationInformationController(),
    );
  }
}
