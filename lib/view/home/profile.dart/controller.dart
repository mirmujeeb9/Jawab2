import 'package:alxza/view/home/home/controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  List<TabModel> tabsList = [
    TabModel(name: "Affiliate", image: "images/person.svg"),
    TabModel(name: "Invoices", image: "images/person.svg"),
    TabModel(name: "Security", image: "images/security.svg"),
    TabModel(name: "Language", image: "images/security.svg"),
    TabModel(name: "Privacy Policy", image: "images/Lock.svg"),
    TabModel(name: "Faq’s", image: "images/faq.svg"),
  ];
}
