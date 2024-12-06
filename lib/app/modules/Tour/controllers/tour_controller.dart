import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TourController extends GetxController {
  //TODO: Implement TourController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  var selectedNationality = ''.obs;
  var selectedCity = ''.obs;
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
}
