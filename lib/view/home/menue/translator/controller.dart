/*import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:textwrap/textwrap.dart';

class TranslatorController extends GetxController {
  static TranslatorController get to => Get.find();
  TextEditingController textEditingController = TextEditingController();
  Rx<bool> isEmpty = true.obs;
  Rx<bool> ismicOpen = false.obs;
  final String apiUrl = 'http://10.0.2.2:8000/api/gpt/translate';
  String wordsspoken = '';
  int? message_id;
  Rx<String> apiState = "pending".obs;
  String generatedtext = '';
  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatemic(bool value) {
    ismicOpen.value = value;
  }



  SpeechToText speechToText = SpeechToText();
  void initspeech() async {
    ismicOpen.value = await speechToText.initialize();
    update();
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  void onSpeechResult(result) {
    wordsspoken = "${result.recognizedWords}";
    textEditingController.text = wordsspoken;
    update();
  }

  void stopListening() async {
    await speechToText.stop();
    update();
  }

  void generateApi() async {
    String text = textEditingController.text;
    apiState.value = "run";
    try {

      var response = await http.post(Uri.parse("${apiUrl}"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${StaticData.token}",
          },
          body: jsonEncode({
            "post_type": "traducteur-ai-hC5y9W",
            "openai_id": "52",
            "maximum_length": "2000",
            "number_of_results": "1",
            "creativity": "1",
            "tone_of_voice": "Professional",
            "language": "ar-AE",
            "texte": text
          }));
      log("response of generateApi ${response.statusCode}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        message_id = data['message_id'];
        log("message_id is ${message_id}");

        textEditingController.text =
            wrap(await fetchGeneratedText(33, 1, 2000, 1)).join('\n');

        apiState.value = "complete";
        log("generated text is ${generatedtext}");
      } else {}
    } catch (error) {
      log("Error in generateApi: $error");
    }
  }

  Future<String> fetchGeneratedText(
      int messageId, int creativity, int maxLength, int numberOfResults) async {
    final url = Uri.parse(
        '${StaticData.baseURL}${StaticData.aiwritergenerateoutput}?message_id=$messageId&creativity=$creativity&maximum_length=$maxLength&number_of_results=$numberOfResults');
    var request = new http.Request("POST", url);
    request.headers["Content-Type"] = "application/json; charset=UTF-8";
    request.headers["Authorization"] = "Bearer ${StaticData.token}";

    var response = await http.Client().send(request);
    log("Streaming response is ${response.statusCode}");
    if (response.statusCode == 200) {
      return listenToTextStream(response);
    } else {
      throw Exception('Failed to fetch generated text: ${response.statusCode}');
    }
  }

  Future<String> listenToTextStream(http.StreamedResponse response) async {
    final stringStream = response.stream;
    final stringBuffer = StringBuffer();

    await for (final chunk in stringStream) {
      stringBuffer.write(utf8.decode(chunk)); // Decode each byte chunk
    }
    return stringBuffer.toString();
  }
}

/// Calls `builder` on keyboard close/open.
/// https://stackoverflow.com/a/63241409/1321917
class KeyboardVisibilityBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    Widget child,
    bool isKeyboardVisible,
  ) builder;

  const KeyboardVisibilityBuilder({
    super.key,
    required this.builder,
  });

  @override
  _KeyboardVisibilityBuilderState createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        const SizedBox(),
        _isKeyboardVisible,
      );
}*/

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:textwrap/textwrap.dart';

class TranslatorController extends GetxController {
  static TranslatorController get to => Get.find();
  TextEditingController textEditingController = TextEditingController();
  Rx<bool> isEmpty = true.obs;
  Rx<bool> ismicOpen = false.obs;
  String wordsspoken = '';
  Rx<String> apiState = "pending".obs;
  Rx<String> generatedtext = ''.obs;
  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatemic(bool value) {
    ismicOpen.value = value;
  }

  SpeechToText speechToText = SpeechToText();
  void initspeech() async {
    ismicOpen.value = await speechToText.initialize();
    update();
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  void onSpeechResult(result) {
    wordsspoken = "${result.recognizedWords}";
    textEditingController.text = wordsspoken;
    update();
  }

  void stopListening() async {
    await speechToText.stop();
    update();
  }

  void generateApi({
    required String text,
  }) async {
    apiState.value = "run";
    try {
      var response = await http.post(
        Uri.parse("${StaticData.mainURL}gpt/translate"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${StaticData.token}",
        },
        body: jsonEncode({"language": "ar-AE", "sentence": text}),
      );
      print("response of generateApi ${response.statusCode}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String responseText = data['translation'];
        log("Translation received: ${responseText}");

        // Update both the controller's text and generatedtext observable
        textEditingController.text = responseText;
        generatedtext.value = responseText; // This will trigger UI updates

        apiState.value = "complete";
        print("Generated text is ${responseText}");
      } else {
        log("Error: ${response.statusCode}");
      }
    } catch (error) {
      log("Error in generateApi: $error");
    }
  }

  Future<String> fetchGeneratedText(
      int messageId, int creativity, int maxLength, int numberOfResults) async {
    final url = Uri.parse(
        '${StaticData.baseURL}${StaticData.aiwritergenerateoutput}?message_id=$messageId&creativity=$creativity&maximum_length=$maxLength&number_of_results=$numberOfResults');
    var request = new http.Request("POST", url);
    request.headers["Content-Type"] = "application/json; charset=UTF-8";
    request.headers["Authorization"] = "Bearer ${StaticData.token}";

    var response = await http.Client().send(request);
    log("Streaming response is ${response.statusCode}");
    if (response.statusCode == 200) {
      return listenToTextStream(response);
    } else {
      throw Exception('Failed to fetch generated text: ${response.statusCode}');
    }
  }

  Future<String> listenToTextStream(http.StreamedResponse response) async {
    final stringStream = response.stream;
    final stringBuffer = StringBuffer();

    await for (final chunk in stringStream) {
      stringBuffer.write(utf8.decode(chunk)); // Decode each byte chunk
    }
    return stringBuffer.toString();
  }
}

/// Calls `builder` on keyboard close/open.
/// https://stackoverflow.com/a/63241409/1321917
class KeyboardVisibilityBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    Widget child,
    bool isKeyboardVisible,
  ) builder;

  const KeyboardVisibilityBuilder({
    super.key,
    required this.builder,
  });

  @override
  _KeyboardVisibilityBuilderState createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        const SizedBox(),
        _isKeyboardVisible,
      );
}
