import 'package:get/get.dart';

class AdvanceDisctionaryController extends GetxController {
  static AdvanceDisctionaryController get to => Get.find();
  Rx<bool> isEmpty = true.obs;
  // Rx<bool> ismicOpen = false.obs;
  void updatetext(bool value) {
    isEmpty.value = value;
  }

  // void updatemic(bool value) {
  //   ismicOpen.value = value;
  // }

  Rx<String> transcriptStatus = "empty".obs;
  void updatetranscriptStatus(String value) {
    transcriptStatus.value = value;
    if (value == "run") {
      Future.delayed(const Duration(seconds: 5), () {
        transcriptStatus.value = "complete";
      });
    }
  }
}
