import 'dart:convert';
import 'package:flightbooking/app/modules/flight/PaymentsGatways/PaymentGatWays/views/payment_gat_ways_view.dart';
import 'package:flightbooking/app/modules/flight/searchFlight/controllers/search_flight_controller.dart';
import 'package:flightbooking/app/storage/keys.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DynamicFormController extends GetxController {
  final flightSearchController = Get.put(SearchFlightController());

  Map<int, Map<String, TextEditingController>> textControllers = {};
  var selectedCountryCode = ''.obs;
  Map<int, Map<String, String>> selectedValues = {};
  Map<dynamic, dynamic> selectedCountries = {};
  Map<int, Map<String, String>> selectedDates = {};

  // Initialize controllers dynamically for adults, children, and infants
  void initializeControllers(int adultsCount, int childrenCount,
      int infantsCount, Map<String, dynamic> formData) {
    int totalCount = adultsCount + childrenCount + infantsCount;
    print('nnn   $infantsCount');
    print('www    $childrenCount');
    print('qqq    $adultsCount');

    for (int i = 0; i < totalCount; i++) {
      textControllers[i] ??= {};
      selectedValues[i] ??= {};
      selectedDates[i] ??= {};
      selectedCountries[i] ??= {};

      Map<String, dynamic> passengerFieldsLead =
          formData['data']['passsengersForm']['lead'];
      passengerFieldsLead.forEach((fieldName, fieldData) {
        String fieldType = fieldData[0]['type'];
        if (['text', 'email', 'phone'].contains(fieldType)) {
          textControllers[i]![fieldName] = TextEditingController();
        }
      });

      Map<String, dynamic> passengerFieldsAll =
          formData['data']['passsengersForm']['all'];
      print('in $passengerFieldsAll');
      passengerFieldsAll.forEach((fieldName, fieldData) {
        String fieldType = fieldData[0]['type'];
        print('in fieldTypeeeeeeeeeeeee ${fieldType}${fieldData[0]}');
        if ([
          'select',
          'text',
          'birthdate',
          'CountryCode,',
          'expirydate',
          'email',
          'phone'
        ].contains(fieldType)) {
          textControllers[i]![fieldName] = TextEditingController();
        }
      });
    }
  }

  // Collect data from forms for adults, children, and infants
  Map<String, dynamic> collectFormData(
      int adultsCount, int childrenCount, int infantsCount) {
    List<Map<String, dynamic>> adultsData = [];
    List<Map<String, dynamic>> childrenData = [];
    List<Map<String, dynamic>> infantsData = [];

    for (int i = 0; i < adultsCount; i++) {
      adultsData.add(_collectPassengerData(i));
      print("adultsData ${i}");
    }

    for (int i = adultsCount; i < adultsCount + childrenCount; i++) {
      childrenData.add(_collectPassengerData(i));
      print("childrenData ${i}");
    }
    print(' check $infantsCount');
    for (int i = adultsCount + childrenCount;
        i < adultsCount + childrenCount + infantsCount;
        i++) {
      infantsData.add(_collectPassengerData(i));
      print('total infants  $infantsCount');
      print("infantsData ${i}....${infantsCount}");
    }
    print('adultsData is::: $adultsData');
    print('ChildrenData is::: $childrenData');
    print('intantsData is::: $infantsData');

    return {
      'adults': adultsData,
      'children': childrenData,
      'infants': infantsData,
    };
  }

  // Helper function to collect data for a passenger (adult/child/infant)
  Map<String, dynamic> _collectPassengerData(int passengerIndex) {
    Map<String, dynamic> passengerData = {};

    textControllers[passengerIndex]?.forEach((fieldName, controller) {
      passengerData[fieldName] = controller.text.trim();
    });

    selectedValues[passengerIndex]?.forEach((fieldName, selectedValue) {
      passengerData[fieldName] = selectedValue;
    });

    selectedDates[passengerIndex]?.forEach((fieldName, selectedDate) {
      passengerData[fieldName] = selectedDate;
    });

    if (selectedCountries.containsKey(passengerIndex)) {
      var countryData = selectedCountries[passengerIndex];
      passengerData['CountryCode'] = countryData['id'];
      passengerData['PhoneCode'] = countryData['phone_code'];
    }
    print(
        ' Passenger Data is :::::index is $passengerIndex and the Data is  $passengerData');
    return passengerData;
  }

  // Submit data to the API
  Future<void> submitFormData(
      int adultsCount, int childrenCount, int infantsCount) async {
    final storage = GetStorage();
    String? bookingReferenceId = storage.read('bookingReferenceId');

    if (bookingReferenceId == null || bookingReferenceId.isEmpty) {
      Get.snackbar('Error', 'Booking Reference ID is missing');
      return;
    }

    Map<String, dynamic> formData =
        collectFormData(adultsCount, childrenCount, infantsCount);
    print(
        ' adults is $adultsCount  children are $childrenCount and infants are $infantsCount');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://marketplace.beta.luxota.network/v1/book/guests'),
    );

    request.headers.addAll({
      'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
    });

    request.fields['referenceId'] = bookingReferenceId;
    var adultsFrom = formData['adults'];

    for (int i = 0; i < adultsFrom.length; i++) {
      var passenger = adultsFrom[i];
      request.fields['passengers[adults][$i][First_name]'] =
          passenger['first_name'];
      request.fields['passengers[adults][$i][Last_name]'] =
          passenger['last_name'];
      request.fields['passengers[adults][$i][Email]'] = passenger['email'];
      request.fields['passengers[adults][$i][Phone][phone]'] =
          passenger['phone'];
      request.fields['passengers[adults][$i][Gender]'] = passenger['gender'];

      if (passenger['PhoneCode'] != null) {
        request.fields['passengers[adults][$i][Phone][countryPhoneCode]'] =
            passenger['PhoneCode'];
      }

      request.fields['passengers[adults][$i][Nationality]'] =
          passenger['CountryCode'].toString() ?? '92';
      request.fields['passengers[adults][$i][Date of birth]'] =
          passenger['birthdate'] ?? '1900-01-01';
      request.fields['passengers[adults][$i][Passport Expiry Date]'] =
          passenger['passport_expiry'] ?? '1900-01-01';
      request.fields['passengers[adults][$i][Passport Number]'] =
          passenger['passport_number'];
    }

    var childrenFrom = formData['children'];

    for (int i = 0; i < childrenFrom.length; i++) {
      var passenger = childrenFrom[i];
      request.fields['passengers[children][$i][First_name]'] =
          passenger['first_name'];
      request.fields['passengers[children][$i][Last_name]'] =
          passenger['last_name'];
      request.fields['passengers[children][$i][Email]'] = passenger['email'];
      request.fields['passengers[children][$i][Phone][phone]'] =
          passenger['phone'];
      request.fields['passengers[children][$i][Gender]'] = passenger['gender'];

      if (passenger['PhoneCode'] != null) {
        request.fields['passengers[children][$i][Phone][countryPhoneCode]'] =
            passenger['PhoneCode'];
      }

      request.fields['passengers[children][$i][Nationality]'] =
          passenger['CountryCode'].toString() ?? '0';
      request.fields['passengers[children][$i][Date of birth]'] =
          passenger['birthdate'] ?? '1900-01-01';
      request.fields['passengers[children][$i][Passport Expiry Date]'] =
          passenger['passport_expiry'] ?? '1900-01-01';
      request.fields['passengers[children][$i][Passport Number]'] =
          passenger['passport_number'];
    }

    var infantsFrom = formData['infants'];

    for (int i = 0; i < infantsFrom.length; i++) {
      var passenger = infantsFrom[i];
      request.fields['passengers[infants][$i][First_name]'] =
          passenger['first_name'] ?? 'name';
      request.fields['passengers[infants][$i][Last_name]'] =
          passenger['last_name'];
      request.fields['passengers[infants][$i][Email]'] = passenger['email'];
      request.fields['passengers[infants][$i][Phone][phone]'] =
          passenger['phone'];
      request.fields['passengers[infants][$i][Gender]'] = passenger['gender'];

      if (passenger['PhoneCode'] != null) {
        request.fields['passengers[infants][$i][Phone][countryPhoneCode]'] =
            passenger['PhoneCode'];
      }

      request.fields['passengers[infants][$i][Nationality]'] =
          passenger['CountryCode'].toString() ?? '0';
      //  request.fields['passengers[infants][$i][Passport Issu Country]'] =
      // passenger['CountryCode'].toString() ?? '0';
      request.fields['passengers[infants][$i][Date of birth]'] =
          passenger['birthdate'] ?? '1900-01-01';
      request.fields['passengers[infants][$i][Passport Expiry Date]'] =
          passenger['passport_expiry'] ?? '1900-01-01';
      request.fields['passengers[infants][$i][Passport Number]'] =
          passenger['passport_number'];
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();

      // Decode the JSON string into a Dart map
      final Map<String, dynamic> decodedData = jsonDecode(responseData);

      //final data = jsonDecode(response.body);

      print('API response data is ::: $decodedData');
      Get.snackbar('Success', 'Forms submitted successfully!');
      Get.to(PaymentGatWaysView());

      var newInvoiceReferenceId = decodedData['invoiceReferenceId'];
      // Store it in GetStorag
      storage.write('newInvoiceReferenceId', newInvoiceReferenceId);
      print('Invoice Reference ID stored: $newInvoiceReferenceId');
      print('Bearer  ${StorageServices.to.getString('usertoken')}');
    } else {
      final reasonPhrase = response.reasonPhrase ?? 'Unknown reason';
      final statusCode = response.statusCode;

      // Read the response body for additional error details
      final errorBody = await response.stream.bytesToString();

      print('Error: Failed to submit forms');
      print('Status Code: $statusCode');
      print('Reason Phrase: $reasonPhrase');
      print('Response Body: $errorBody');
      Get.snackbar('Error', 'Failed to submit forms');
    }
  }

  // Fetch countries (for the country code dropdown)
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
