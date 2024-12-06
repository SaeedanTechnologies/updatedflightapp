import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DynamicFormController extends GetxController {
  final storage = GetStorage();
  var bookingReferenceId = ''.obs;
  @override
  void onInit() {
    super.onInit();

    bookingReferenceId.value = storage.read('bookingReferenceId');
  }

  final Map<String, TextEditingController> textEditingControllers = {};

  DynamicFormController(Map<String, dynamic> formData) {
    final Map<String, dynamic> lead =
        Map<String, dynamic>.from(formData['data']['passsengersForm']['lead']);
    final Map<String, dynamic> all =
        Map<String, dynamic>.from(formData['data']['passsengersForm']['all']);

    final combinedSections = {
      ...lead,
      ...all,
    };

    for (var entry in combinedSections.entries) {
      final fieldKey = entry.key;
      final fieldData = entry.value[0];

      if (fieldData['type'] == 'text' ||
          fieldData['type'] == 'email' ||
          fieldData['type'] == 'phone') {
        textEditingControllers[fieldKey] = TextEditingController();
      } else if (fieldData['type'] == 'birthdate' ||
          fieldData['type'] == 'expirydate') {
        textEditingControllers[fieldKey] = TextEditingController();
      }
    }
  }

  String? getValue(String key) {
    return textEditingControllers[key]?.text;
  }

  void dispose() {
    for (var controller in textEditingControllers.values) {
      controller.dispose();
    }
  }

  void setDateValue(String key, DateTime selectedDate) {
    final dateString = "${selectedDate.toLocal()}"
        .split(' ')[0]; // Format the date as "YYYY-MM-DD"
    textEditingControllers[key]?.text = dateString;
  }

  Map<String, dynamic> prepareRequestBody() {
    Map<String, dynamic> requestBody = {
      "referenceId": bookingReferenceId.value,
    };

    textEditingControllers.forEach((key, controller) {
      requestBody['passengers[adults][0][$key]'] = controller.text;
    });

    return requestBody;
  }
}
