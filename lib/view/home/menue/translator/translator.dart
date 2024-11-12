/*import 'dart:convert';
import 'dart:developer';
import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _translatedText = "";
  String _selectedLanguage = "French";

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> translateText(String text, String language) async {
    final url = Uri.parse('${StaticData.mainURL}gpt/translate');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'sentence': text, 'language': language}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _translatedText = data['translation'];
      });
    } else {
      setState(() {
        _translatedText = "Error: Unable to translate.";
      });
    }
  }

  // Function to save translated text
  Future<void> saveTranslatedText() async {
    if (_translatedText.isNotEmpty) {
      final url = Uri.parse('${StaticData.mainURL}save/translate');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': _inputController.text, // You can modify the title as needed
          'content': _translatedText,
          'type':
              'translation', // You can adjust this based on your requirements
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Translated text saved successfully!'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error: Unable to save text.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No translated text to save.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Translator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Enter text to translate',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown for language selection
            DropdownButton<String>(
              value: _selectedLanguage,
              items: ["French", "Arabic"].map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                _translatedText.isNotEmpty
                    ? _translatedText
                    : "Translated text will appear here",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_inputController.text.isNotEmpty) {
                  translateText(_inputController.text, _selectedLanguage);
                }
              },
              child: const Text("Translate"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTranslatedText,
              child: const Text("Save Translated Text"),
            ),
          ],
        ),
      ),
    );
  }
}

void testEndpoint() async {
  var url = Uri.parse("http://192.168.0.121:8080/api/get/translate");
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("Response data: ${response.body}");
      log("Response data: ${response.body}");
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}*/

import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen>
// with WidgetsBindingObserver
{
  TextEditingController textEditingController = TextEditingController();

  final List<String> languages = ["Arabic", "English", "French", "Spanish"];
  String selectedLanguage = "Arabic"; // Default language

  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    TranslatorController.to.ismicOpen.value = false;
    TranslatorController.to.isEmpty.value = true;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<TranslatorController>(builder: (obj) {
          return Obx(() {
            return SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50.h,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CustomContainer(
                              onTap: () {
                                HomeController.to.selectedItemPosition.value =
                                    0;
                              },
                              width: 35.w,
                              height: 35.w,
                              margin: EdgeInsets.only(bottom: 5.h),
                              borderRadius: 8.r,
                              borderColor: Colors.grey,
                              borderWidth: 1.w,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                  size: 15.h,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: TextWidget(
                                text: "AI Translator",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            // JustTheTooltip(
                            //   borderRadius: BorderRadius.circular(7.r),
                            //   tailLength: 5,
                            //   margin: const EdgeInsets.all(0),
                            //   preferredDirection: AxisDirection.down,
                            //   tailBaseWidth: 15.w,
                            //   controller: tooltipController,
                            //   backgroundColor: Colors.white,
                            //   offset: 0,
                            //   content: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 15.w, vertical: 3.h),
                            //     child: TextWidget(
                            //       text: "100 000 / 250 000",
                            //       fontSize: 12.sp,
                            //       color: primaryColor,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   child:

                            // InkWell(
                            //   onTap: () {
                            //     // tooltipController.showTooltip();
                            //     Get.dialog(CreditDialogue(
                            //       onYesBtnClick: () {
                            //         Get.back();
                            //         HomeController
                            //             .to.selectedItemPosition.value = 11;
                            //         // Get.to(() => Upgrade_to_pro(),
                            //         //     transition: Transition.leftToRight);
                            //       },
                            //     ));
                            //   },
                            //   child: Image.asset(
                            //     "images/token.png",
                            //     height: 35.h,
                            //     width: 35.w,
                            //   ),
                            // ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 0, // Spread radius
                              blurRadius: 2, // Blur radius
                              offset: const Offset(0,
                                  2), // Offset from top to create a shadow from the bottom
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(13.r),
                              bottomRight: Radius.circular(13.r))),
                      height: isKeyboardVisible ? 310.h : 410.h,
                      width: ScreenUtil().screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Scrollbar(
                              child: new SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: true,
                                child: SizedBox(
                                  height: obj.isEmpty.value
                                      ? null
                                      : isKeyboardVisible
                                          ? 260.h
                                          : 360.h,
                                  child: TextFormField(
                                    onTap: () {
                                      // textEditingController.selection =
                                      //     textEditingController.selection =
                                      //         TextSelection(
                                      //             baseOffset: 0,
                                      //             extentOffset: obj
                                      //                 .textEditingController
                                      //                 .text
                                      //                 .length);
                                    },
                                    controller: obj.textEditingController,
                                    onChanged: (v) {
                                      if (v.isNotEmpty) {
                                        if (obj.isEmpty.value) {
                                          obj.updatetext(false);
                                        }
                                      } else {
                                        obj.updatetext(true);
                                      }
                                    },
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                    ),
                                    maxLines: obj.isEmpty.value
                                        ? null
                                        : isKeyboardVisible
                                            ? 11
                                            : 17,
                                    keyboardType: TextInputType.multiline,
                                    textAlign: TextAlign.justify,
                                    decoration: InputDecoration(
                                      // filled: true,
                                      // fillColor: Colors.black,
                                      border: InputBorder.none,
                                      hintText: obj.ismicOpen.value
                                          ? "Speak now ..."
                                          : "Enter text ...",
                                      hintStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        color: textgrey,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            !obj.isEmpty.value || obj.ismicOpen.value
                                ? const SizedBox()
                                : CustomContainer(
                                    onTap: () async {
                                      final clipboardData =
                                          await Clipboard.getData(
                                              Clipboard.kTextPlain);

                                      textEditingController.text =
                                          clipboardData!.text!;
                                      if (textEditingController
                                          .text.isNotEmpty) {
                                        obj.updatetext(false);
                                      }
                                    },
                                    borderRadius: 50.r,
                                    height: 28.h,
                                    width: 91.w,
                                    color: primaryColor,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "images/clipboard.png",
                                            height: 15.h,
                                            width: 13.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          TextWidget(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            text: "Paste",
                                            color: whiteColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            const Spacer(),
                            obj.isEmpty.value
                                ? const SizedBox()
                                : SizedBox(
                                    height: 40.h,
                                    // color: Colors.amber,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text: textEditingController
                                                    .text));
                                          },
                                          child: SvgPicture.asset(
                                            width: 20.w,
                                            height: 20.h,
                                            "images/copy.svg",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Share.share(
                                              textEditingController.text,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            width: 20.w,
                                            height: 20.h,
                                            "images/share.svg",
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            textEditingController.clear();
                                            obj.updatetext(true);
                                            obj.updatemic(false);
                                          },
                                          child: SvgPicture.asset(
                                              width: 20.w,
                                              height: 20.h,
                                              "images/Delete.svg"),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isKeyboardVisible ? 20.h : 30.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          borderRadius: 15.r,
                          height: isKeyboardVisible ? 31.h : 50.h,
                          width: 135.w,
                          color: primaryColor.withOpacity(0.2),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Center(
                              child: TextWidget(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                text: "Automatic detect",
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Image.asset(
                            "images/arrows.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        CustomContainer(
                          borderRadius: 15.r,
                          height: isKeyboardVisible ? 31.h : 50.h,
                          width: 135.w,
                          color: primaryColor.withOpacity(0.2),
                          child: Center(
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedLanguage,
                                underline: SizedBox(),
                                dropdownColor: Colors.white,
                                onChanged: (String? newLanguage) {
                                  setState(() {
                                    selectedLanguage = newLanguage!;
                                    // Call a function in TranslatorController if needed to handle language change
                                  });
                                },
                                items: languages.map<DropdownMenuItem<String>>(
                                  (String language) {
                                    return DropdownMenuItem<String>(
                                      value: language,
                                      child: Text(
                                        language,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: isKeyboardVisible ? 15.h : 20.h,
                    ),
                    isKeyboardVisible
                        ? Button(
                            onTap: () {
                              print("This works");
                            },
                            height: 36.h,
                            width: 217.w,
                            text: "Start translation",
                            fontWeight: FontWeight.w500,
                            borderRadius: 50.r,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              obj.isEmpty.value
                                  ? SizedBox()
                                  : SizedBox(
                                      height: 40.h,
                                      width: 55.w,
                                    ),
                              AvatarGlow(
                                glowColor: primaryColor,
                                animate: obj.ismicOpen.value,
                                glowCount: 1,
                                child: FloatingActionButton.large(
                                  onPressed: () {
                                    if (obj.textEditingController.text
                                        .isNotEmpty) {
                                      obj.generateApi(
                                          text: obj.textEditingController.text,
                                          language: selectedLanguage);
                                    }

                                    if (obj.isEmpty.value) {
                                      if (obj.ismicOpen.value) {
                                        obj.updatemic(false);
                                      } else {
                                        obj.updatemic(true);
                                      }
                                    }
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  backgroundColor: primaryColor,
                                  shape:
                                      const CircleBorder(), // Set background color to pink
                                  child: SvgPicture.asset(
                                    obj.isEmpty.value
                                        ? obj.ismicOpen.value
                                            ? "images/stop.svg"
                                            : "images/mic.svg"
                                        : "images/translation.svg",
                                    color:
                                        obj.isEmpty.value ? null : Colors.white,
                                    height: obj.ismicOpen.value ? 25.h : 40.h,
                                    width: obj.ismicOpen.value ? 25.w : 30.w,
                                  ),
                                ),
                              ),
                              obj.isEmpty.value
                                  ? SizedBox()
                                  : Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: FloatingActionButton(
                                        heroTag: "translation",
                                        onPressed: () {},
                                        elevation: 0,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        backgroundColor:
                                            primaryColor.withOpacity(0.2),
                                        shape:
                                            const CircleBorder(), // Set background color to pink
                                        child: Icon(
                                          Icons.volume_up_sharp,
                                          size: 30.sp,
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                    obj.isEmpty.value || isKeyboardVisible
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: TextWidget(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              text: "Translate",
                            ),
                          ),
                  ],
                ),
              ),
            );
          });
        });
      }),
    );
  }
}
