import 'package:get/get.dart';

import '../controllers/card_information_controller.dart';

class CardInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardInformationController>(
      () => CardInformationController(),
    );
  }
}
