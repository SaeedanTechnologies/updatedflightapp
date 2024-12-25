import 'dart:convert';

import 'package:flightbooking/app/models/getResponseModel/hotels/getCityModel.dart';
import 'package:flightbooking/app/models/getResponseModel/hotels/getCountryModel.dart';
import 'package:flightbooking/app/models/getResponseModel/sessions/getSessionId.dart';
import 'package:flightbooking/app/repositories/configsRepo/configsRepo.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:flightbooking/app/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;

class HotelsRepository {
// code by murtaza  start from here

  final String _cityUrl = '$baseUrl/cities';

  Future<GetCities> fetchCities(String query) async {
    try {
      final response = await http.get(Uri.parse(_cityUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Filter based on the search query if it's not empty
        final cities = (data['data'] as List)
            .map((item) => CityData.fromJson(item))
            .where((city) =>
                city.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return GetCities(data: cities);
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Error fetching cities: $e');
    }
  }

  static const String baseUrlCountry = '$baseUrl/countries';

  Future<List<CountryData>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(baseUrlCountry));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Map JSON to CountryData list
        return jsonData.map((json) => CountryData.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load countries. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

//code from murtaza end here

  Future getPopularDestinations() async {
    // URL
    String url = "$baseUrl/popularroutes/hotel";

    // Parameters
    Map<String, String> parameters = {
      "lang": "en",
      "currency": "158",
      // Add more parameters if needed
    };

    // Construct the URL with parameters
    Uri uri = Uri.parse(url).replace(queryParameters: parameters);

    try {
      // Make GET request
      http.Response response = await http.get(uri);

      // Check status code
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print("GET request failed with status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Error making GET request: $e");
    }
  }

  ConfigRepository configRepository = ConfigRepository();

  // Future<GetSessionId> getSessionIdForHotelSearch({
  //   int? cityCode,
  //   int? nationality,
  //   String? checkinDate,
  //   String? checkOutDate,
  //   String? selectedAdults,
  //   String? selectedChildren,
  //   String? childAge,
  //   String? searchIdentity,
  // }) async {
  //   Map<String, dynamic> formData = {
  //     "city": cityCode.toString(),
  //     "nationality": nationality.toString(),
  //     "checkInDate": checkinDate ?? "",
  //     "checkOutDate": checkOutDate ?? "",
  //     // "rooms[0][adults]": 2.toString(),
  //     // "rooms[0][children]": 1.toString(),
  //     // "rooms[0][child-age][1]": 2.toString(),
  //     "searcherIdentity": searchIdentity ?? "",
  //   };

  //   // Log the form data
  //   print('Form Data: $formData');

  //   try {
  //     EasyLoading.show(status: "Searching Hotels");

  //     String body = formData.entries
  //         .map((entry) =>
  //             '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
  //         .join('&');

  //     final response = await http.post(
  //       Uri.parse(
  //           'https://marketplace.beta.luxota.network/v1/search/hotel?lang=en&currency=158'),
  //       body: body,
  //       headers: <String, String>{
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       EasyLoading.dismiss();
  //       Map<String, dynamic> data = json.decode(response.body);
  //       print(data);
  //       return GetSessionId.fromJson(data);
  //     } else {
  //       EasyLoading.dismiss();
  //       print("API Response: ${response.body}");
  //       Utils.snakbar(title: "Error", body: response.body);
  //       throw Exception("Failed to load data: ${response.body}");
  //     }
  //   } catch (error) {
  //     EasyLoading.dismiss();
  //     print("Error occurred: $error");
  //     throw Exception("An error occurred while making the request.");
  //   }
  // }

  Future<GetSessionId> getSessionIdForHotelSearch({
    required int cityCode,
    required int nationality,
    required String checkinDate,
    required String checkOutDate,
    required List<Map<String, dynamic>> rooms, // Pass the list of rooms here
    String? searchIdentity,
  }) async {
    Map<String, dynamic> formData = {
      "city": cityCode,
      "nationality": nationality,
      "checkInDate": checkinDate,
      "checkOutDate": checkOutDate,
      "searcherIdentity": searchIdentity ?? "",
    };

    // Dynamically add room data to the formData
    for (int i = 0; i < rooms.length; i++) {
      formData["rooms[$i][adults]"] = rooms[i]["adults"].toString();
      formData["rooms[$i][children]"] = rooms[i]["children"].toString();

      // Add child ages if there are children in the room
      List<dynamic> childAges = rooms[i]["childAges"];
      for (int j = 0; j < childAges.length; j++) {
        formData["rooms[$i][child-age][$j]"] = childAges[j].toString();
      }
    }

    print('Form Dataaa: $formData');

    //try {
    EasyLoading.show(status: "Searching Hotels");

    String body = formData.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');

    final response = await http.post(
      Uri.parse('$baseUrl/search/hotel?lang=en&currency=158'),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      Map<String, dynamic> hoterSearchSessionID = json.decode(response.body);
      print('Hotel search Session ID is: $hoterSearchSessionID');

      return GetSessionId.fromJson(hoterSearchSessionID);
    } else {
      EasyLoading.dismiss();
      print("API Response: ${response.body}");
      Utils.snakbar(title: "Error", body: response.body);
      throw Exception("Failed to load data: ${response.body}");
    }
    // } catch (error) {
    //   EasyLoading.dismiss();
    //   print("Error occurred: $error");
    //   throw Exception("An error occurred while making the request.");
    // }
  }

  Future<dynamic> getsearchHotelResults({
    required String sessionId,
  }) async {
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
      print('results of Search Hotels $data');
      // Get.toNamed(Routes.SEARCH_, arguments: [data,]);

      return data;
    } else {
      print(response.body);
      throw Exception();
    }
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

//   Future<GetSessionId> getSessionIdForHotelSearch({
//     Int? cityCode,
//     String? nationality,
//     String? checkinDate,
//     String? checkOutDate,
//     String? selectedAdults,
//     String? selectedChildren,
//     String? childAge,
//     String? searchIdentity,
//   }) async {
//     Map<String, String> formData = {
//       "city": cityCode ?? "",
//       "nationality": nationality ?? "",
//       "checkInDate": checkinDate ?? "",
//       "checkOutDate": checkOutDate ?? "",
//       "rooms[0][adults]": selectedAdults ?? "",
//       "rooms[0][children]": selectedChildren ?? "",
//       "rooms[0][child-age][1]": childAge ?? "",
//       "searcherIdentity": searchIdentity ?? "",
//     };

//     try {
//       EasyLoading.show(status: "Searching Hotels");

//       // Adjusting for URL-encoded form data
//       String body = formData.entries
//           .map((entry) =>
//               '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
//           .join('&');

//       final response = await http.post(
//         Uri.parse(
//             'https://marketplace.beta.luxota.network/v1/search/hotel?lang=en&currency=158'),
//         body: body,
//         headers: <String, String>{
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       );

//       if (response.statusCode == 200) {
//         EasyLoading.dismiss();
//         Map<String, dynamic> data = json.decode(response.body);

//         return GetSessionId.fromJson(data);
//       } else {
//         EasyLoading.dismiss();
//         Utils.snakbar(title: "Error", body: response.body);
//         throw Exception("Failed to load data: ${response.body}");
//       }
//     } catch (error) {
//       EasyLoading.dismiss();
//       print("Error occurred: $error");
//       throw Exception("An error occurred while making the request.");
//     }
//   }
//   ConfigRepository configRepository = ConfigRepository();
//   //Get session Id for searching flights
//   Future<GetSessionId> getSessionIdForHotelSearch(
//       {String? cityCode,
//       String? nationality,
//       String? checkinDate,
//       String? checkOutDate,
//       String? selectedAdults,
//       String? selectedChildren,
//       String? childAge,
//       String? searchIdentity}) async {
//     Map<String, String> formData = {
//       "city": cityCode!,
//       "nationality": nationality!,
//       "checkInDate": checkinDate!,
//       "checkOutDate": checkOutDate!,
//       "rooms[0][adults]": selectedAdults!,
//       "rooms[0][children]": selectedChildren!,
//       "rooms[0][child-age][1]": childAge!,
//       // "rooms[1][adults]": "1",
//       // "rooms[1][children]": "0",
//       // "rooms[1][child-age][0]": "3",
//       // "rooms[1][child-age][2]": "5",
//       "searcherIdentity": searchIdentity!,
//     };
//     try {
//       EasyLoading.show(status: "Searching Hotels");
//       final response = await http.post(
//         Uri.parse(
//             'https://marketplace.beta.luxota.network/v1/search/hotel?lang=en&currency=158'),
//         body: jsonEncode(formData),
//         headers: <String, String>{
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       );

//       if (response.statusCode == 200) {
//         EasyLoading.dismiss();
//         Map<String, dynamic> data = await json.decode(response.body);

//         return GetSessionId.fromJson(data);
//       } else {
//         EasyLoading.dismiss();

//         Utils.snakbar(title: "Error", body: response.body);
//         throw Exception();
//       }
//     } catch (error) {
//       EasyLoading.dismiss();

//       throw Exception();//througying this exception
//     }
//   }

//   Future<GetSessionId> searchHotels(dynamic data) async {
//     try {
//       dynamic response = await getPostResponse(
//           "$baseUrl/search/hotel?lang=en&currency=158", data);
//       return GetSessionId.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<GetPopularHotelsDestinations> getpopularHotelsDestinations() async {
//     try {
//       dynamic response = await networkApiService
//           .getResponse("$baseUrlLive/popularroutes/hotel?lang=en&currency=158");
//       print(response);
//       return GetPopularHotelsDestinations.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

// //get hotel profile by passing referenceId
//   var referenceId = "jpyxzVOFfCCA2diK75UN5f1414e48e386";
//   Future<GetHotelProfile> getHotelProfile() async {
//     try {
//       dynamic response = await networkApiService
//           .getResponse("$baseUrlLive+/profile/hotel?referenceId=$referenceId");
//       return GetHotelProfile.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   //create bookingRequest for hotels
//   Future<CreateBookingRequest> createBookingRequestForHotels(
//       dynamic data) async {
//     try {
//       dynamic response = await networkApiService.getPostResponse(
//           "$baseUrlLive+/book/hotel/create", data);

//       return CreateBookingRequest.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   //sending guests information to the hotel
//   Future<CreateBookingRequest> sendGuestInformation(dynamic data) async {
//     try {
//       dynamic response = await networkApiService.getPostResponse(
//           "$baseUrlLive+/book/guests", data);
//       return CreateBookingRequest.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }

// //
//   int pageno = 1;
//   int currency = 158;
//   String lang = 'en';

//   Future<GetSearchedHotelsResponse> getsearchhotelsResults() async {
//     try {
//       dynamic response = await networkApiService.getResponse(
//           "https://marketplace.alauddein.com/v1/search/results?sessionId=${StorageServices.to.getString(sessionId)}&page=$pageno&currency=$currency&lang=$lang");

//       return GetSearchedHotelsResponse.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
}
