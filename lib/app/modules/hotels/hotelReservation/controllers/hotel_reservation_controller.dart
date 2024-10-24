import 'package:flutter/widgets.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:get/get.dart';

class HotelReservationController extends GetxController {
  DateRange? dateRange;
  final startingDate=TextEditingController().obs;
  final endingDate=TextEditingController().obs;
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
    var selectedPersons = 1.obs;
}
