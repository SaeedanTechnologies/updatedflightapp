import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardInformationController extends GetxController {
  final  cardNumber = TextEditingController(text: "4242 4242 4242 4242 ").obs;
  final  cardHolderName = TextEditingController().obs;
  final  cvcCode = TextEditingController().obs;
  final  expiryCode = TextEditingController().obs;
  bool showback=false;


  
}
