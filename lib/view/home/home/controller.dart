import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<int> selectedItemPosition = 0.obs;
}
