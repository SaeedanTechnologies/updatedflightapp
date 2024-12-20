import 'package:get/get.dart';

import '../controllers/payment_gat_ways_controller.dart';

class PaymentGatWaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentGatWaysController>(
      () => PaymentGatWaysController(),
    );
  }
}
