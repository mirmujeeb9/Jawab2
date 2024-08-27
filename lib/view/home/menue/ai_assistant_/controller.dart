import 'package:alxza/view/home/menue/file_analyzer/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAssistentController extends GetxController {
  static AiAssistentController get to => Get.find();
  List<Message> messagellist = [];
  TextEditingController messagecontropller = TextEditingController();
  String pdf =
      "uickai-openai-content-image-generator-and-writing-assistant-saas-license (4).pdf";
  void addmessage() {
    if (messagecontropller.text.isNotEmpty) {
      AiAssistentController.to.messagellist.add(Message(
        type: Type.text,
        fromId: "user",
        msg: messagecontropller.text,
        read: '',
        sent: DateTime.now().toString(),
        toId: "chatbot",
      ));
      if (messagellist.length == 1) {
        AiAssistentController.to.messagellist.add(Message(
          type: Type.text,
          fromId: "chatbot",
          msg:
              "Social Media: Bridging the Gap, Expanding Connections Social media has revolutionized communication, connecting people across borders and cultures. It fosters a sense of unity, allowing individuals to exchange ideas, collaborate, and find like-minded communities. However, its impact extends beyond personal connections. Social media has transformed marketing strategies, political campaigns, and social activism, amplifying voices and sparking global movements. ",
          read: '',
          sent: DateTime.now().add(Duration(seconds: 1)).toString(),
          toId: "chatbot",
        ));
      }

      messagecontropller.clear();
      update(['list']);
    }
  }
}
