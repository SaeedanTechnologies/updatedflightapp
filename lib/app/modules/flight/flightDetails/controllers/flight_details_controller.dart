import 'package:flightbooking/app/models/getResponseModel/hotels/getFlightRules.dart';
import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FlightDetailsController extends GetxController {
  final storage = GetStorage();
  var bookingId = "".obs;
  @override
  void onInit() {
    super.onInit();
    String? token = StorageServices.to.getString('usertoken');
    print('Retrieved Token: $token');
    bookingId.value = storage.read('bookingReferenceId');
  }

  Future<GetRulesModel> getFlightsRules(id) async {
    return await flightsRepository.getFlightRules(id);
  } //sd

  var isCollapsed = true.obs;

  void toggleCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }

  FlightsRepository flightsRepository = FlightsRepository();
  Future<Widget> fetchflightLogo(logo) async {
    return await flightsRepository.fetchFligtLogo(logo);
  }
}
