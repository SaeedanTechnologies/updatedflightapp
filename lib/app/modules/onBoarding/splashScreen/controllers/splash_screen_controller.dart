import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flightbooking/app/storage/keys.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () => StorageServices.to.getString(usertoken).isNotEmpty
            ? Get.offAllNamed(Routes.HOME)
            : Get.offAllNamed(Routes.SIGNIN));
  }
}
