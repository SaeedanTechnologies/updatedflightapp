import 'dart:convert';
import 'package:flightbooking/app/models/getResponseModel/configs/getconfigsModel.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;

class ConfigRepository {
  Future<GetConfigurationsModel> configuration() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/node'),
      );

      if (response.statusCode == 200) {
        var responseData = await json.decode(response.body);

        return GetConfigurationsModel.fromJson(responseData);
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
}
