import 'package:flightbooking/app/repositories/authRepo/authRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var accepttermsandConditions = false.obs;
  AuthRepository authRepository = AuthRepository();
  Future signIn() async {
    await authRepository
        .sendDeviceInfoForLogin(
            email: emailController.value.text.toString(),
            password: passwordController.value.text.toString())
        .then((value) {
      // emailController.value.clear();
      // passwordController.value.clear();
    });
  }
}
