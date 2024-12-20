import 'dart:convert';

import 'package:flightbooking/app/models/getResponseModel/flight/getAirportmodel.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getFlightRules.dart';
import 'package:flightbooking/app/models/getResponseModel/sessions/getSessionId.dart';
import 'package:flightbooking/app/modules/flight/addPassenger/views/dynamic_form_view.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flightbooking/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FlightsRepository {
  //Feteching airports
  Future<GetAirports> fetchAirports(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://marketplace.beta.luxota.network/v1/search/airports?q=$query'),
      );

      if (response.statusCode == 200) {
        dynamic responseData = await json.decode(response.body);

        return GetAirports.fromJson(responseData);
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }

//Get session Id for searching flights
  Future<GetSessionId> getSessionIdForFlightSearch({
    required String origincode,
    required String destinationcode,
    required String departure,
    required String returndate,
    required String adults,
    required String children,
    required String infants,
    required String tripType,
    required String economy,
    required String searchIdentity,
  }) async {
    try {
      EasyLoading.show(status: "Searching flights");
      final response = await http.post(
        Uri.parse('$baseUrl/search/flight?currency=158&lang=en'),
        body: {
          'origin': origincode,
          'destination': destinationcode,
          'departure': departure,
          'return': tripType == "roundTrip" ? returndate : '',
          'adults': adults,
          'children': children,
          'infants': infants,
          'cabin': economy,
          'tripType': tripType == "roundTrip" ? 'roundTrip' : 'oneWay',
          'charterOnly': 'false',
          'searcherIdentity': searchIdentity //from config file
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      print(response);
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Map<String, dynamic> data = await json.decode(response.body);
        print(data);

        return GetSessionId.fromJson(data);
      } else {
        EasyLoading.dismiss();

        Utils.snakbar(title: "Error", body: response.body);
        throw Exception();
      }
    } catch (error) {
      EasyLoading.dismiss();

      throw Exception();
    }
  }

//get searched flitghts results
  Future<dynamic> getsearchFlightsResults(
      {required String sessionId, required String tripType}) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/search/results?sessionId=$sessionId&page=1&currency=158&lang=en'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response

      var data = json.decode(response.body);
      print(data);
      Get.toNamed(Routes.SEARCH_FLIGHT_RESULTS, arguments: [data, tripType]);

      return data;
    } else {
      print(response.body);
      throw Exception();
    }
  }

  Future<Widget> fetchFligtLogo(logo) async {
    // Replace the URL with your image URL
    final String imageUrl = 'https://alphacdn.infra.luxota.cloud$logo';

    // Fetch the image
    final Image image = Image.network(
      imageUrl,
      width: 40,
      height: 40,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return const SizedBox(
          height: 30,
          width: 30,
        );
      },
      errorBuilder: (context, error, stackTrace) =>
          const Text('Error loading image'),
    );

    return image;
  }

  Future<dynamic> popularFlights() async {
    const String url =
        'https://marketplace.beta.luxota.network/v1/popularroutes/flight?lang=en&currency=158';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with error: $e');
    }
  }

  Future<GetRulesModel> getFlightRules(String flightBufferRID) async {
    var storage = GetStorage();
    var referenceId = storage.read('referenceId');
    final String url =
        'https://marketplace.beta.luxota.network/v1/profile/flight?referenceId=$referenceId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetRulesModel.fromJson(data);
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      print('Error: $e');
      throw Exception();
    }
  }

  Future<void> createBookingRequest() async {
    const String url =
        "https://marketplace.beta.luxota.network/v1/book/flight/create";

    final storage = GetStorage();
    String? referenceId = storage.read('referenceId');

    if (referenceId == null || referenceId.isEmpty) {
      print("Error: referenceId is null or empty.");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'referenceId': referenceId,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String bookingReferenceId = data['bookingReferenceId'];

        print("Success: $data");

        print(" BookingId   $bookingReferenceId");
        final storage = GetStorage();
        storage.write('bookingReferenceId', bookingReferenceId);
        print('storedBookingId is ${storage.read('bookingReferenceId')}');

        fetchBookingInformation(bookingReferenceId);
      } else {
        final errorData = jsonDecode(response.body);
        print("${errorData['referenceId'] ?? response.body}");
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  Future<void> fetchBookingInformation(String bookingId) async {
    final String url =
        'https://marketplace.beta.luxota.network/v1/book/$bookingId/bookingInformation';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        Map<String, dynamic> dataMap = data;

        Get.to(() => DynamicForm(
              formData: dataMap,
            ));

        print('Response Data: $data');
      } else {
        print(
            'Failed to load booking information. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  //passengerInfo api

  Future<void> bookGuest() async {
    const String url = "https://marketplace.beta.luxota.network/v1/book/guests";

    var requestBody = {
      "referenceId": "1ber4sdc91pk1lzguv37r44675141088b34f",
      "passengers[adults][0][Gender]": "male",
      "passengers[adults][0][First_name]": "John",
      "passengers[adults][0][Last_name]": "Doe",
      "passengers[adults][0][email]": "a@gmail.com",
      "passengers[adults][0][Phone][phone]": "36589632",
      "passengers[adults][0][Phone][countryPhoneCode]": "98",
      "passengers[adults][0][Nationality]": "104",
      "passengers[adults][0][Passport Expiry Date]": "2026-09-20",
      "passengers[adults][0][Date of birth]": "2000-02-20",
      "passengers[adults][0][Passport Number]": "A123456789",
    };

    try {
      // Make the POST request
      var response = await http.post(
        Uri.parse(url),
        headers: {
          // "Authorization": "Bearer $token",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: requestBody,
      );

      // Handle the response
      if (response.statusCode == 200) {
        print("Booking successful: ${response.body}");
      } else {
        print("Failed to book guest. Status code: ${response.statusCode}");
        print("Error response: ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
