import 'dart:convert';
import 'dart:developer';
import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdvanceDictionaryController extends GetxController {
  static AdvanceDictionaryController get to => Get.find();

  TextEditingController textEditingController = TextEditingController();
  Rx<bool> isEmpty = true.obs;
  Rx<String> transcriptStatus = "empty".obs;
  Rx<String> outputText = "".obs;
  Rx<String> apiState = "pending".obs;
  String selectedLanguage = "English"; // Default language

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in the TextEditingController and update observables
    textEditingController.addListener(() {
      isEmpty.value = textEditingController.text.isEmpty;
    });
  }

  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatetranscriptStatus(String status) {
    transcriptStatus.value = status;
  }

  Future<void> getExplanation(String sentence) async {
    apiState.value = "run";
    try {
      final url = Uri.parse('${StaticData.mainURL}gpt/dict');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'sentence': sentence, 'language': "french"}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("IM HERE");
        String explanation = data['explanation'];

        print("Explanation fetched: $explanation");

        // Update the textEditingController with the explanation
        textEditingController.text = explanation;
        outputText.value = explanation;

        transcriptStatus.value = "complete";
        apiState.value = "complete";

        // Force a UI update if needed
        update(); // Trigger a refresh in GetBuilder widgets if used
      } else {
        outputText.value = "Error: Unable to fetch explanation.";
        apiState.value = "error";
        update(); // Ensure UI reflects error state
      }
    } catch (error) {
      log("Error in getExplanation: $error");
      outputText.value = "Error: Unable to fetch explanation.";
      apiState.value = "error";
      update(); // Ensure UI reflects error state
    }
  }

  Future<void> saveExplanation() async {
    if (outputText.value.isNotEmpty) {
      final url = Uri.parse('${StaticData.mainURL}save/dict');
      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'title': 'Explanation for "${textEditingController.text}"',
            'content': outputText.value,
            'type': 'explanation',
          }),
        );

        if (response.statusCode == 201) {
          Get.snackbar("Success", "Explanation saved successfully!",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Unable to save explanation.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (error) {
        Get.snackbar("Error", "Unable to save explanation.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Info", "No explanation to save.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
