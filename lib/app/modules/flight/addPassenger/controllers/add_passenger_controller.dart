import 'package:flightbooking/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddPassengerController extends GetxController {
  final storage = GetStorage();
  var bookingId = "".obs;
  @override
  void onInit() {
    super.onInit();
    String? token = StorageServices.to.getString('usertoken');
    print('Retrieved Token: $token');
    bookingId.value = storage.read('bookingReferenceId');
  }

  final nameController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  var countryController = TextEditingController().obs;
  var expiryController = TextEditingController().obs;
  var selectedGender = "Male".obs;
  final passportController = TextEditingController().obs;
  final Rx<DateTime?> dob = DateTime.now().obs;
  final Rx<DateTime?> expiryDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: dob.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dob.value =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      dobController.value.text = formatDate(dob.value);
    }
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      // Pad the month and day with a leading zero if less than 10
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      return '$day-$month-${date.year}';
    } else {
      return 'Not selected';
    }
  }

  Future<void> selectExpiryDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: expiryDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      expiryDate.value =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      expiryController.value.text = formatDate(expiryDate.value);
    }
  }
}
