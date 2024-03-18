import 'package:get/get.dart';

class SignUpContoller extends GetxController {
  static SignUpContoller get to => Get.find();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;
  bool confirmpassword = true;
}
