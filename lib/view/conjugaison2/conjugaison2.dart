import 'package:alxza/view/conjugaison%201/model.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Conjugaison_2 extends StatefulWidget {
  const Conjugaison_2({super.key});

  @override
  State<Conjugaison_2> createState() => _Conjugaison_2State();
}

class _Conjugaison_2State extends State<Conjugaison_2> {
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
                    onTap: () {},
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
                  hint: "جَعَلَ",
                  hintTextSize: 14.sp,
                  fontFamily: 'Poppins',
                  controller: entercontroller,
                  validator: (v) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              TextWidget(
                text: "جَعَلَ - يَجْعَلُ",
                fontSize: 19.sp,
                fontWeight: FontWeight.w400,
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
