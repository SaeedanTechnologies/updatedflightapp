import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchFlightResultsController extends GetxController {
  var filteredData = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    filteredData = Get.arguments[0]['data'];
  }

  var selectedStop = ''.obs;

  void setSelectedStop(String value) {
    selectedStop.value = value;
  }

  var price = 1000.0.obs;

  void setPrice(double value) {
    price.value = double.parse(value.toStringAsFixed(2));
  }

  final List<String> flightCompanies = [
    'Delta Airlines',
    'American Airlines',
    'United Airlines',
    'Emirates',
    'Lufthansa',
  ];
  var selectedFlight = ''.obs;

  void selectFlight(String flight) {
    selectedFlight.value = flight;
  }

  String formatDate(String dateString) {
    // Parse the input string to DateTime
    DateTime dateTime = DateTime.parse(dateString);

    // Define the desired date format
    final DateFormat formatter = DateFormat('d MMM');

    // Format the date
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  FlightsRepository flightsRepository = FlightsRepository();
  Future<Widget> fetchflightLogo(logo) async {
    return await flightsRepository.fetchFligtLogo(logo);
  }
}
