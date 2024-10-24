import 'package:flightbooking/app/models/getResponseModel/hotels/getFlightRules.dart';
import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightDetailsController extends GetxController {

  Future<GetRulesModel> getFlightsRules(id)async{
    return await flightsRepository.getFlightRules(id);
  }

  var isCollapsed = true.obs;

  void toggleCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }
   FlightsRepository flightsRepository = FlightsRepository();
   Future<Widget> fetchflightLogo(logo) async {
    return await flightsRepository.fetchFligtLogo(logo);
  }
}
