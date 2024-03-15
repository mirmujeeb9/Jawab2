import 'package:get/get.dart';

class FolderController extends GetxController {
  static FolderController get to => Get.find();

  Rx<bool> isdocumentclick = false.obs;

  void updateisdocumentclick(bool value) {
    isdocumentclick.value = value;
  }
}
