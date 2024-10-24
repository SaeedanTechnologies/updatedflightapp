import 'package:get/get.dart';

class HotelPaymentController extends GetxController {
 var selectedPaymentMethod = 'Credit Card'.obs;

  void updatePaymentMethod(String paymentMethod) {
    selectedPaymentMethod.value = paymentMethod;
  }
}
