import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PackageController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  var departureCounrty = ''.obs;

  var destinationCountry = ''.obs;

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

  Future<void> searchPackage({
    required String token,
    String? startDate,
    String? endDate,
    String? country,
    required String searcherIdentity,
  }) async {
    final String url =
        'https://marketplace.beta.luxota.network/v1/search/package?lang=en&currency=158';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
          if (country != null) 'country': country,
          'searcherIdentity': searcherIdentity,
        },
      );

      if (response.statusCode == 200) {
        // Decode the response
        final responseData = json.decode(response.body);
        print('Response: $responseData');
        // Handle success (you can return data or navigate to another page)
      } else {
        print(
            'Failed to fetch data. Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }
}
