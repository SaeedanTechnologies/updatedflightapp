import 'dart:convert';

import 'package:flightbooking/app/storage/keys.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DynamicFormController extends GetxController {
  // Store TextEditingControllers for each field dynamically
  Map<int, Map<String, TextEditingController>> textControllers = {};
  var selectedCountryCode = ''.obs;

  // Store selected values for dropdowns and date pickers
  Map<int, Map<String, String>> selectedValues = {};

  // For country code selection
  Map<dynamic, dynamic> selectedCountries = {};

  // For date selection
  Map<int, Map<String, String>> selectedDates = {};

  // Initialize controllers dynamically
  void initializeControllers(
      int passengerCount, Map<String, dynamic> formData) {
    print('hhhh');
    for (dynamic i = 0; i < passengerCount; i++) {
      textControllers[i] ??= {};
      selectedValues[i] ??= {};
      selectedDates[i] ??= {};
      selectedCountries[i] ??= {}.toString();

      Map<String, dynamic> passengerFieldsLead =
          formData['data']['passsengersForm']['lead'];
      print('in $passengerFieldsLead');
      passengerFieldsLead.forEach((fieldName, fieldData) {
        print('in foreach ${fieldName}${fieldData}');

        String fieldType = fieldData[0]['type'];
        print('in fieldType ${fieldType}${fieldData[0]}');
        if (['text', 'email', 'phone'].contains(fieldType)) {
          print('initializeControllers ${fieldName}');
          textControllers[i]![fieldName] = TextEditingController();
        }
      });

      Map<String, dynamic> passengerFields =
          formData['data']['passsengersForm']['all'];
      print('in ${passengerFields}');
      passengerFields.forEach((fieldName, fieldData) {
        print('in foreach ${fieldName}${fieldData}');

        String fieldType = fieldData[0]['type'];
        print('in fieldType ${fieldType}${fieldData[0]}');
        if ([
          'select',
          'text',
          'birthdate',
          'CountryCode,',
          'expirydate',
          'email',
          'phone'
        ].contains(fieldType)) {
          print('initializeControllers $fieldName');
          textControllers[i]![fieldName] = TextEditingController();
        }
      });
    }
  }

  // Collect data from forms
  Map<String, dynamic> collectFormData(int passengerCount) {
    List<Map<String, dynamic>> passengers = [];
    for (int i = 0; i < passengerCount; i++) {
      Map<String, dynamic> passengerData = {};

      // Collect text fields
      textControllers[i]?.forEach((fieldName, controller) {
        passengerData[fieldName] = controller.text.trim();
        print('passengerdat $fieldName');
      });

      // Collect dropdowns
      selectedValues[i]?.forEach((fieldName, selectedValue) {
        passengerData[fieldName] = selectedValue;
        print('passengerdattt $fieldName');
      });

      // Collect date pickers
      selectedDates[i]?.forEach((fieldName, selectedDate) {
        passengerData[fieldName] = selectedDate;
        print('passengerdat_dates $fieldName');
      });

      if (selectedCountries.containsKey(i)) {
        var countryData = selectedCountries[i];
        passengerData['CountryCode'] = countryData['id']; // Country ID
        passengerData['PhoneCode'] = countryData['phone_code']; // Phone Code
        print('Country code  is :: ${passengerData['CountryCode']}');
        print(' phoneCode is :: ${passengerData['PhoneCode']}');
      }

      // // Collect country code
      // if (selectedCountries.containsKey(i)) {
      //   passengerData['CountryCode'] = selectedCountries[i];
      //   print('passengerdatfggggggggg ${passengerData['CountryCode']}');
      // }

      passengers.add(passengerData);
      print('Passenger Data is ::  $passengerData');
    }
    final storage = GetStorage();
    String? bookingReferenceId = storage.read('bookingReferenceId');
    return {
      'referenceId': bookingReferenceId,
      'passengers': {'adults': passengers}
    };
  }

  // Submit data to API

  Future<void> submitFormData(int passengerCount) async {
    //try {
    final storage = GetStorage();
    String? bookingReferenceId = storage.read('bookingReferenceId');

    // Validate referenceId
    if (bookingReferenceId == null || bookingReferenceId.isEmpty) {
      Get.snackbar('Error', 'Booking Reference ID is missing');
      return;
    }
    print("refBookingId is :$bookingReferenceId");
    // Collect data
    Map<String, dynamic> apiPayload = collectFormData(passengerCount);
    print('apiPayload is : $apiPayload');

    // Transform apiPayload to match the API's required form-data structure
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://marketplace.beta.luxota.network/v1/book/guests'),
    );

    // Add headers
    request.headers.addAll({
      'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
    });

    // Add referenceId to request fields
    request.fields['referenceId'] = bookingReferenceId;

    // Flatten and add passenger data to the request
    Map<String, dynamic> passengers = apiPayload['passengers'];
    List<dynamic> adults = passengers['adults'];

    for (int i = 0; i < adults.length; i++) {
      var adult = adults[i];
      print('Adultsssss $adult');
      request.fields['passengers[adults][$i][First_name]'] =
          adult['first_name'];
      request.fields['passengers[adults][$i][Last_name]'] = adult['last_name'];
      request.fields['passengers[adults][$i][Email]'] = adult['email'];
      request.fields['passengers[adults][$i][Phone][phone]'] = adult['phone'];
      request.fields['passengers[adults][$i][Gender]'] = adult['gender'];

      // request.fields['passengers[adults][$i][Phone][countryPhoneCode]'] = '92';
      // //adult["countryCode"];

      // request.fields['passengers[adults][$i][Nationality]'] =
      //     adult['CountryCode'];
      // //1bfsd3i3pufspeer7evhud14676147daa9b4c,
      // print('Nationality is type::${adult['CountryCode']} ');

      // Include country phone code and ID
      request.fields['passengers[adults][$i][Phone][countryPhoneCode]'] =
          adult['PhoneCode']; // Phone Code
      print('Phone Code is :: ${adult['PhoneCode']}');
      // request.fields['passengers[adults][$i][Nationality]'] =
      //     adult['CountryCode']; // Country ID
      request.fields['passengers[adults][$i][Nationality]'] =
          adult['CountryCode'] != null ? adult['CountryCode'].toString() : '0';

      print('Country Code is :: ${adult['CountryCode']}');

      request.fields['passengers[adults][$i][Date of birth]'] =
          adult['birthdate'];
      print('date Date of Birth: ${adult['birthdate']}');
      request.fields['passengers[adults][$i][Passport Expiry Date]'] =
          adult['passport_expiry'];
      print('expiryee date is ::${adult['passport_expiry']} ');

      print('Passport Expiryee: ${adult['passport_expiry'] ?? '1900-01-01'}');

      request.fields['passengers[adults][$i][Passport Number]'] =
          adult['passport_number'];
      print('fields ${request.fields}');
    }

    // Send request
    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData =
          await response.stream.bytesToString(); // Decode response
      print('API Response Data: $responseData');
      Get.snackbar('Success', 'Forms submitted successfully!');
      print('Formated Date print:: ');
    } else {
      print(
          'Error: ${response.statusCode}, ${await response.stream.bytesToString()}');
      Get.snackbar('Error', 'Failed to submit forms');
    }
  }
  //  catch (e) {

  //   print('Exception: $e');
  //   Get.snackbar('Error', 'An error occurred while submitting the forms');
  // }

  Future<List<Map<String, dynamic>>> fetchCountries() async {
    final url =
        Uri.parse('https://marketplace.beta.luxota.network/v1/countries');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((country) {
          return {
            'id': country['id'],
            'phone_code': country['phone_code'],
            'title': country['title'],
          };
        }).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      print('Error fetching countries: $e');
      return [];
    }
  }
}

  // Future<void> submitFormData(int passengerCount) async {
  //   try {
  //     final storage = GetStorage();
  //     String? referenceId = storage.read('bookingReferenceId');
  //     // Collect data
  //     Map<String, dynamic> apiPayload = collectFormData(passengerCount);
  //     print('apiPayload is : $apiPayload');

  //     // Transform apiPayload to match the API's required form-data structure
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('https://marketplace.beta.luxota.network/v1/book/guests'),
  //     );

  //     request.headers.addAll({
  //       'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
  //     });
  //     request.fields['referenceId'] =
  //         referenceId!; //but here im getting this id not from form's fields im getting it from GetStorage so how can i pass that id in the api as ID is required
  //     // Flatten and add data to the request
  //     Map<String, dynamic> passengers = apiPayload['passengers'];
  //     List<dynamic> adults = passengers['adults'];

  //     for (int i = 0; i < adults.length; i++) {
  //       var adult = adults[i];
  //       request.fields['passengers[adults][$i][First_name]'] =
  //           adult['first_name'];
  //       request.fields['passengers[adults][$i][Last_name]'] =
  //           adult['last_name'];
  //       request.fields['passengers[adults][$i][email]'] = adult['email'];
  //       request.fields['passengers[adults][$i][phone]'] = adult['phone'];
  //       request.fields['passengers[adults][$i][gender]'] = adult['gender'];
  //       request.fields['passengers[adults][$i][Date of birth]'] =
  //           adult['birthdate'];
  //       request.fields['passengers[adults][$i][Passport Expiry Date]'] =
  //           adult['passport_expiry'];
  //       request.fields['passengers[adults][$i][Passport Number]'] =
  //           adult['passport_number'];
  //       // Add other fields as needed
  //     }

  //     // Send request
  //     var response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseData =
  //           await response.stream.bytesToString(); // Decode response
  //       print('API Response Data: $responseData');
  //       Get.snackbar('Success', 'Forms submitted successfully!');
  //     } else {
  //       print(
  //           'Error: ${response.statusCode}, ${await response.stream.bytesToString()}');
  //       Get.snackbar('Error', 'Failed to submit forms');
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     Get.snackbar('Error', 'An error occurred while submitting the forms');
  //   }
  // }
//}
