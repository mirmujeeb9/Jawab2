import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class VideoTranscriptionController extends GetxController {
  static VideoTranscriptionController get to => Get.find();

  Rx<bool> isEmpty = true.obs;
  TextEditingController videourlcontroller = TextEditingController();
  Rx<String> transcriptStatus = "empty".obs;
  Rx<String> transcribedText = ''.obs; // To store the transcribed text
  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatetranscriptStatus(String value) {
    transcriptStatus.value = value;
    if (value == "run") {
      Future.delayed(const Duration(seconds: 5), () {
        transcriptStatus.value = "complete";
      });
    }
  }

  Future<void> uploadVideo(File videoFile) async {
    final url = Uri.parse(
        '${StaticData.mainURL}transcribe/video'); // Replace with your API endpoint

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
        'video_file',
        videoFile.path,
      ));

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = jsonDecode(responseData);

        // Update the transcribed text
        transcribedText.value = jsonResponse['transcribed_text'];
        print(transcribedText.value);
        videourlcontroller.text = jsonResponse['transcribed_text'];
        updatetranscriptStatus("complete");
      } else {
        // Handle error response
        transcribedText.value = 'Error: ${response.reasonPhrase}';
        updatetranscriptStatus("error");
      }
    } catch (e) {
      // Handle exceptions
      transcribedText.value = 'Exception: $e';
      updatetranscriptStatus("error");
    }
  }
}
 /*import 'dart:convert';
import 'dart:io';
import 'package:alxza/utilis/static_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class VideoTranscriptionController extends GetxController {
  static VideoTranscriptionController get to => Get.find();

  Rx<bool> isEmpty = true.obs;
  Rx<String> transcriptStatus = "empty".obs;
  Rx<String> transcribedText = ''.obs; // To store the transcribed text

  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatetranscriptStatus(String value) {
    transcriptStatus.value = value;
    if (value == "run") {
      Future.delayed(const Duration(seconds: 5), () {
        transcriptStatus.value = "complete";
      });
    }
  }

  Future<void> uploadVideo(File videoFile) async {
    final url = Uri.parse(
        '${StaticData.mainURL}transcribe/video'); // Replace with your API endpoint

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
        'video_file',
        videoFile.path,
      ));

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = jsonDecode(responseData);

        // Update the transcribed text
        transcribedText.value = jsonResponse['transcribed_text'];
        updatetranscriptStatus("complete");
      } else {
        // Handle error response
        transcribedText.value = 'Error: ${response.reasonPhrase}';
        updatetranscriptStatus("error");
      }
    } catch (e) {
      // Handle exceptions
      transcribedText.value = 'Exception: $e';
      updatetranscriptStatus("error");
    }
  }
}
 */