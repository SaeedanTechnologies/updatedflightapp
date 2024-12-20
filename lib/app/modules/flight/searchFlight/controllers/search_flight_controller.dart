import 'package:flightbooking/app/models/getResponseModel/flight/getAirportmodel.dart';
import 'package:flightbooking/app/models/getResponseModel/flight/getSearchedFlightsModel.dart';
import 'package:flightbooking/app/repositories/configsRepo/configsRepo.dart';
import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SearchFlightController extends GetxController {
  var selectedOrigin = "DIE".obs;
  var selectedOrigincode = "".obs;
  var selectedDestination = "TIA".obs;
  var selectedDestinationCode = "".obs;
  var selectedTravelers = 1.obs;
  var selectedAdults = 1.obs;
  var selectedChildren = 0.obs;
  var selectedInfrants = 0.obs;

  final RxString selectedClass = RxString('economy');
  final Rx<DateTime?> departureDate = DateTime.now().obs;
  final Rx<DateTime?> returnDate = DateTime.now().obs;
  final RxBool isSelectingClosingDate = false.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: isSelectingClosingDate.value
          ? (returnDate.value ?? DateTime.now())
          : (departureDate.value ?? DateTime.now()),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      if (isSelectingClosingDate.value) {
        returnDate.value =
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      } else {
        departureDate.value =
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      }
      isSelectingClosingDate.toggle();
    }
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      // Pad the month and day with a leading zero if less than 10
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      return '${date.year}-$month-$day';
    } else {
      return 'Not selected';
    }
  }

  ConfigRepository configRepository = ConfigRepository();
  FlightsRepository searchFlightRepository = FlightsRepository();
  GetSearchFlightResults? getSearchFlightsResult;
  Future<dynamic> getSearchedFlightData(String tripType) async {
    var data = await configRepository.configuration();
    var getSessionId = await searchFlightRepository.getSessionIdForFlightSearch(
        origincode: swipeOneWay.value
            ? selectedDestinationCode.value
            : selectedOrigincode.value.toString(),
        destinationcode: swipeOneWay.value
            ? selectedOrigincode.value.toString()
            : selectedDestinationCode.value,
        departure: tripType == "oneWay"
            ? formatDate(departureDate.value)
            : formatDate(startDate.value),
        returndate: tripType == "oneWay"
            ? formatDate(returnDate.value)
            : formatDate(endDate.value),
        adults: selectedAdults.value.toString(),
        children: selectedChildren.value.toString(),
        infants: selectedInfrants.value.toString(),
        economy: selectedClass.value,
        tripType: tripType,
        searchIdentity: data.searcherIdentity);

    final storage = GetStorage();
    storage.write('selectedInfants', selectedInfrants.value);
    storage.write('selectedChildrens', selectedChildren.value);
    storage.write('selectedAdults', selectedAdults.value);

    var result = await searchFlightRepository.getsearchFlightsResults(
        sessionId: getSessionId.sessionId!, tripType: tripType);

    var referenceId = result["data"][0]["flightBufferReferenceId"];
    storage.write('referenceId', referenceId);

    print(referenceId);

    return result;
  }

  var swipeOneWay = false.obs;
  var swipeRoundWay = false.obs;
  Rx<DateTime?> startDate = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?> endDate = Rx<DateTime?>(DateTime.now());

  void setStartDate(DateTime? date) {
    startDate.value = date;
  }

  void setEndDate(DateTime? date) {
    endDate.value = date;
  }

  var getairportsModel = GetAirports(data: [], status: false).obs;
}
