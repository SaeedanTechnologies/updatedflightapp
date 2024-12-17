import 'dart:convert';
import 'package:flightbooking/app/models/getResponseModel/configs/getconfigsModel.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ConfigRepository {
  Future<GetConfigurationsModel> configuration() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/node'),
      );

      if (response.statusCode == 200) {
        var responseData = await json.decode(response.body);
        final searcherIdentity = responseData['searcherIdentity'];

        if (searcherIdentity != null) {
          // Initialize GetStorage
          final storage = GetStorage();

          // Store the searcherIdentity in GetStorage
          storage.write('searcherIdentity', searcherIdentity);

          print('searcherIdentity stored: $searcherIdentity');
        } else {
          print('searcherIdentity not found in response');
        }

        return GetConfigurationsModel.fromJson(responseData);
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
}
