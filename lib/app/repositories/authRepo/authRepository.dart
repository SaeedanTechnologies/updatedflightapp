import 'package:flightbooking/app/models/getResponseModel/users/getuserInformation.dart';
import 'package:flightbooking/app/resources/apiKeys.dart';
import 'package:flightbooking/app/routes/app_pages.dart';
import 'package:flightbooking/app/storage/keys.dart';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:flightbooking/app/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class AuthRepository {
  Future<void> registerUser(dynamic data) async {
    String url = '$baseUrl/register';
    try {
      EasyLoading.show(status: "Creating account...");
      http.Response response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Get.offAllNamed(Routes.SIGNIN);
      } else {
        EasyLoading.dismiss();

        Utils.snakbar(title: "Error", body: response.body);
      }
    } catch (e) {
      EasyLoading.dismiss();
      // Handle any exceptions
      print('Error: $e');
    }
  }

  //get device identficiation
  Future<void> sendDeviceInfoForLogin(
      {required email, required password}) async {
    // Define the URL
    String url = 'https://marketplace.beta.luxota.network/v1/devices';

    // Generate random device_id
    String deviceId = Random().nextInt(1000000).toString();

    // Generate random device_model
    List<String> models = [
      'iPhone',
      'Samsung Galaxy',
      'Google Pixel',
      'OnePlus'
    ];
    String deviceModel = models[Random().nextInt(models.length)];

    // Define the request body
    Map<String, String> requestBody = {
      'device_id': deviceId,
      'app_version': '2.0',
      'device_model': deviceModel,
      // Add other necessary parameters here
    };

    // Make the POST request
    try {
      EasyLoading.show(status: "SigningIn...");
      http.Response response = await http.post(
        Uri.parse(url),
        body: requestBody,
      );

      // Check the status code of the response
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        loginUser(email, password, data['deviceIdentity']);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  Future<void> loginUser(
      String email, String password, String deviceIdentity) async {
    String url = 'https://marketplace.beta.luxota.network/v1/login/Local';

    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
      'postmanRequest': false,
      'deviceIdentity': deviceIdentity,
    };

    // Make the POST request
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          // Add any other headers if required
        },
      );
      // print(response.body);
      // Check the status code of the response
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        StorageServices.to.setString(key: usertoken, value: data['token']);
        getUserInformation();
        Get.offAndToNamed(Routes.HOME);
        // You can parse the response body here if needed
      } else {
        // Request failed
        Utils.snakbar(title: "Error", body: response.body);
      }
    } catch (e) {
      print(e);
      // Handle any exceptions
    }
  }

  void getUserInformation() async {
    const String url = 'https://marketplace.beta.luxota.network/v1/user/info';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}'
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        StorageServices.to.setString(
            key: userInfo,
            value: getUserInformationToJson(GetUserInformation.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
