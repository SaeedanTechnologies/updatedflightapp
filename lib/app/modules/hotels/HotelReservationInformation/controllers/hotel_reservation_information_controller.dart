import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelReservationInformationController extends GetxController {
 final nameController=TextEditingController().obs;
 final dobController=TextEditingController().obs;
   final Rx<DateTime?> dob = DateTime.now().obs;
     var countryController = TextEditingController().obs;
     var emailController = TextEditingController().obs;
     var countryImage="".obs;
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
}
