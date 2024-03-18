import 'package:get/get.dart';

class CongugationController extends GetxController {
  static CongugationController get to => Get.find();
  Rx<bool> isEmpty = true.obs;
  void updatetext(bool value) {
    isEmpty.value = value;
  }
}
