import 'package:get/get.dart';

import '../controllers/recently_booked_controller.dart';

class RecentlyBookedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentlyBookedController>(
      () => RecentlyBookedController(),
    );
  }
}
