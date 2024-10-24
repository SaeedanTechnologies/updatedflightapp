import 'package:get/get.dart';

import '../controllers/review_hotel_booking_details_controller.dart';

class ReviewHotelBookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewHotelBookingDetailsController>(
      () => ReviewHotelBookingDetailsController(),
    );
  }
}
