import 'dart:convert';
import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SearchHotelsController extends GetxController {
  Rx<DateTime?> startDate = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?> endDate = Rx<DateTime?>(DateTime.now());

  var selectedCity = 'Select  City'.obs;
  var selectedCountry = 'Select Country'.obs;

  var selectedOrigin = "DIE".obs;
  var selectedOrigincode = "".obs;
  var selectedDestination = "TIA".obs;
  var selectedDestinationCode = "".obs;
  var selectedTravelers = 1.obs;
  var selectedAdults = 1.obs;
  var selectedChildren = 0.obs;
  var selectedInfrants = 0.obs;

  void setStartDate(DateTime? date) {
    startDate.value = date;
  }

  void setEndDate(DateTime? date) {
    endDate.value = date;
  }

//commented by Murtaza
  // List <String> tabs=['All Hotel','Recommended','Tranding','High Level Hotel'];
  // var selectedTab=0.obs;
  HotelsRepository hotelsRepository = HotelsRepository();
}
