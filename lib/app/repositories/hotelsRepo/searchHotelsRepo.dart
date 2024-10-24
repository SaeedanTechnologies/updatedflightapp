import 'dart:convert';

import 'package:flightbooking/app/models/getResponseModel/sessions/getSessionId.dart';
import 'package:flightbooking/app/repositories/configsRepo/configsRepo.dart';
import 'package:flightbooking/app/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class HotelsRepository {
  Future getPopularDestinations() async {
    // URL
    String url =
        "https://marketplace.beta.luxota.network/v1/popularroutes/hotel";

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
  //Get session Id for searching flights
  Future<GetSessionId> getSessionIdForFlightSearch(
      {int? cityCode,
      String? nationality,
      String? checkinDate,
      String? checkOutDate,
      String? searchIdentity}) async {
    Map<String, String> formData = {
      "city": "5603",
      "nationality": "105",
      "checkInDate": "2024-12-01",
      "checkOutDate": "2024-12-05",
      "rooms[0][adults]": "2",
      "rooms[0][children]": "1",
      "rooms[0][child-age][1]": "6",
      "rooms[1][adults]": "1",
      "rooms[1][children]": "0",
      "rooms[1][child-age][0]": "3",
      "rooms[1][child-age][2]": "5",
      "searcherIdentity": searchIdentity!,
    };
    try {
      EasyLoading.show(status: "Searching Hotels");
      final response = await http.post(
        Uri.parse(
            'https://marketplace.beta.luxota.network/v1/search/hotel?lang=en&currency=158'),
        body: jsonEncode(formData),
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

  // Future<GetSessionId> searchHotels(dynamic data) async {
  //   try {
  //     dynamic response = await getPostResponse(
  //         "$baseUrl/search/hotel?lang=en&currency=158", data);
  //     return GetSessionId.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

//popular desitinations
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
