import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await StorageServices.to.init();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flight Booking',
          initialRoute: Routes.SPLASH_SCREEN,
          theme: ThemeData(useMaterial3: true),
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
