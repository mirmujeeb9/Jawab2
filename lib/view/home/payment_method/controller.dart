import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.find();
  TextEditingController cardholdername = TextEditingController();
  TextEditingController cardno = TextEditingController();
  TextEditingController expdate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  Rx<int> selectedIndex = 10.obs;
  Rx<bool> addcardClick = false.obs;
  bool password = true;
  void updateselectedIndex(int value) {
    selectedIndex.value = value;
  }

  void updateaddcardClick(bool value) {
    addcardClick.value = value;
  }

  List<PaymentModel> paymentList = [
    PaymentModel(name: "Credit Card", image: "images/payment_method.png"),
    PaymentModel(name: "PayPal", image: "images/paypal.png"),
    PaymentModel(name: "Visa", image: "images/visa.png"),
    PaymentModel(name: "Google Pay", image: "images/google.png"),
  ];
}

class PaymentModel {
  String? name;
  String? image;

  PaymentModel({required this.name, required this.image});
}
