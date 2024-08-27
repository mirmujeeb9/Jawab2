import 'package:alxza/view/home/menue/file_analyzer/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileAnalyzerController extends GetxController {
  static FileAnalyzerController get to => Get.find();
  List<Message> messagellist = [];
  TextEditingController messagecontropller = TextEditingController();
  String pdf =
      "uickai-openai-content-image-generator-and-writing-assistant-saas-license (4).pdf";
  void addmessage() {
    if (messagecontropller.text.isNotEmpty) {
      FileAnalyzerController.to.messagellist.add(Message(
        type: Type.text,
        fromId: "user",
        msg: messagecontropller.text,
        read: '',
        sent: DateTime.now().toString(),
        toId: "chatbot",
      ));
      if (messagellist.length == 1) {
        FileAnalyzerController.to.messagellist.add(Message(
          type: Type.text,
          fromId: "chatbot",
          msg:
              "Ask me everything you want to know about this document.",
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
