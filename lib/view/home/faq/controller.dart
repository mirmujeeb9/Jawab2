import 'package:get/get.dart';

class FaqController extends GetxController {
  static FaqController get to => Get.find();

  List<bool> faqbool = [];
  List<FaqModel> faqlist = [
    FaqModel(
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
      isExpanded: false,
      question: "Are there any setup or installation fees?",
    ),
    FaqModel(
      question: "Can I try Alxza before committing to a paid plan?",
      isExpanded: false,
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
    ),
    FaqModel(
      question:
          "For software applications, online services, or subscription-based platforms?",
      isExpanded: false,
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
    ),
    FaqModel(
      question:
          "It is common for providers to offer free trials to potential customers.",
      isExpanded: false,
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
    ),
    FaqModel(
      question:
          "To determine if a free trial is available, you can visit the website of the product.",
      isExpanded: false,
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
    ),
    FaqModel(
      question:
          "It's always a good idea to read the terms and conditions of any trial offer to understand the specific",
      isExpanded: false,
      answer:
          "Yes, you can try certain services or products before committing to a paid plan in many cases. However, the availability of free trials or trial periods depends on the specific service or product you are interested in.",
    ),
  ];
}

class FaqModel {
  String? question;
  String? answer;
  bool? isExpanded;
  FaqModel({
    this.question,
    this.answer,
    this.isExpanded = false,
  });
}
