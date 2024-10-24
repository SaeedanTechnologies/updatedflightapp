import 'package:flightbooking/app/repositories/authRepo/authRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final phonenumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final authRepo = AuthRepository();
  var isLoading = false.obs;

  Future<void> registerUser(data) async {
    isLoading = true.obs;
    await authRepo
        .registerUser(data);
      
  }

  // GetUserInformation getUserInformation = GetUserInformation();
  // Future<void> getUserinformations(data) async {
  //   isLoading = true.obs;
  //   await getUserInformation.getUserInformations(data).then((value) {
  //     Get.toNamed(Routes.SIGNIN);

  //     isLoading = false.obs;
  //     Utils.snakbar(title: "Registered", body: "Registered Successfully!");
  //   }).onError((error, stackTrace) {
  //     isLoading = false.obs;
  //     Utils.snakbar(title: "Failed to register", body: error.toString());
  //   });
  // }

  // HotelsRepository searchHotelRepo = HotelsRepository();

  // Future<void> searchHotels(data) async {
  //   isLoading = true.obs;
  //   await searchHotelRepo.searchHotels(data).then((value) {

  //     StorageServices.to.setString(key: sessionId, value: value.sessionId!);

  //     Get.toNamed(Routes.SIGNIN);

  //     isLoading = false.obs;
  //   }).onError((error, stackTrace) {
  //     isLoading = false.obs;
  //     Utils.snakbar(title: "Failed to Search", body: error.toString());
  //   });
  // }

  // //getsearchResult
  // GetSearchedResultsRepository getSearchedResultsRepository=GetSearchedResultsRepository();
  // Future<void> getSearchedResults() async {
  //   isLoading = true.obs;
  //   await getSearchedResultsRepository.getsearchhotelsResults().then((value) {

  //     // StorageServices.to.setString(key: sessionId, value: value.sessionId!);

  //     Get.toNamed(Routes.SIGNIN);

  //     isLoading = false.obs;
  //   }).onError((error, stackTrace) {
  //     isLoading = false.obs;
  //     Utils.snakbar(title: "Failed to Search", body: error.toString());
  //   });
  // }
  // HotelsRepository hotelsRepository =HotelsRepository();
  // //getPopularHotelsDestinaitons
  //  Future<void> getPopularHotelsDestinations() async {
  //   isLoading = true.obs;
  //   await hotelsRepository.getpopularHotelsDestinations().then((value) {

  //     // StorageServices.to.setString(key: sessionId, value: value.sessionId!);

  //     Get.toNamed(Routes.SIGNIN);

  //     isLoading = false.obs;
  //   }).onError((error, stackTrace) {
  //     isLoading = false.obs;
  //     Utils.snakbar(title: "Failed to Search", body: error.toString());
  //   });
  // }
}
