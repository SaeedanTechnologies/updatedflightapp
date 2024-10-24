import 'dart:convert';

import 'package:flightbooking/app/models/getResponseModel/flight/getAirportmodel.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getFlightRules.dart';
import 'package:flightbooking/app/models/getResponseModel/sessions/getSessionId.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flightbooking/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
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

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Map<String, dynamic> data = await json.decode(response.body);

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
    final String url =
        'https://marketplace.beta.luxota.network/v1/profile/flight?referenceId=$flightBufferRID';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request was successful, handle the response data here
        var data = jsonDecode(response.body);
        return GetRulesModel.fromJson(data);
      } else {
        // Request was unsuccessful, handle error
        print('Failed to load data: ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      // An error occurred while fetching data
      print('Error: $e');
      throw Exception();
    }
  }
}
