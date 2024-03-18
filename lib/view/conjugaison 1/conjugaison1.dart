import 'package:alxza/view/conjugaison%201/model.dart';
import 'package:alxza/view/conjugaison2/conjugaison2.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Conjugaison_1 extends StatefulWidget {
  const Conjugaison_1({super.key});

  @override
  State<Conjugaison_1> createState() => _Conjugaison_1State();
}

class _Conjugaison_1State extends State<Conjugaison_1> {
  TextEditingController entercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                text: "Arabic Conjugation",
                leading: true,
              ),
              SizedBox(
                height: 35.h,
              ),
              SizedBox(
                width: 335.w,
                child: CustomTextFormField(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Get.to(const Conjugaison_2(),
                          transition: Transition.rightToLeft);
                    },
                    child: Icon(
                      Icons.mic,
                      color: primaryColor,
                      size: 30.sp,
                    ),
                  ),
                  color: const Color(0xffF3F0F3),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(128),
                  ],
                  hint: "Entrez du texte ...",
                  hintTextSize: 14.sp,
                  fontFamily: 'Poppins',
                  controller: entercontroller,
                  validator: (v) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 500.h,
                width: 335.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffC9C4D1),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(13.r))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const TextWidget(text: "Verbes les plus populaires"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: const Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: Conjugaison1_Model.mylist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      Conjugaison1_Model.mylist[index].texts!,
                                      style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      Conjugaison1_Model.mylist[index].texts!,
                                      style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
