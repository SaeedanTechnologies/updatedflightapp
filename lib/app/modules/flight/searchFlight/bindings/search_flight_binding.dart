import 'package:get/get.dart';

import '../controllers/search_flight_controller.dart';

class SearchFlightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchFlightController>(
      () => SearchFlightController(),
    );
  }
}
