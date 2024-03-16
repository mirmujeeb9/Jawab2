import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffiliateController extends GetxController {
  static AffiliateController get to => Get.find();

  TextEditingController affiliatecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController bankinfocontroler = TextEditingController();
  TextEditingController amountcontroler = TextEditingController();
}
