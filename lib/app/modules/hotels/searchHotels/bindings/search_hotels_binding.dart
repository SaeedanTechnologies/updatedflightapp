import 'package:get/get.dart';

import '../controllers/search_hotels_controller.dart';

class SearchHotelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchHotelsController>(
      () => SearchHotelsController(),
    );
  }
}
