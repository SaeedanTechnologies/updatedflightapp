import 'package:get/get.dart';

import '../controllers/search_flight_results_controller.dart';

class SearchFlightResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchFlightResultsController>(
       SearchFlightResultsController(),
    );
  }
}
