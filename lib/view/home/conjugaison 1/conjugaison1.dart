import 'package:alxza/view/home/conjugaison%201/controller.dart';
import 'package:alxza/view/home/conjugaison%201/model.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class Conjugaison_1 extends StatefulWidget {
  const Conjugaison_1({super.key});

  @override
  State<Conjugaison_1> createState() => _Conjugaison_1State();
}

class _Conjugaison_1State extends State<Conjugaison_1> {
  TextEditingController entercontroller = TextEditingController();
  @override
  void dispose() {
    entercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<CongugationController>(builder: (obj) {
        return SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        onTap: () {},
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
                          text: "Arabic Conjugation",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 0, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset: const Offset(0,
                            2), // Offset from top to create a shadow from the bottom
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(13.r),
                        bottomRight: Radius.circular(13.r))),
                height: 120.h,
                width: ScreenUtil().screenWidth,
                child: Center(
                  child: SizedBox(
                    width: 335.w,
                    child: CustomTextFormField(
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          if (obj.isEmpty.value) {
                            obj.updatetext(false);
                          }
                        } else {
                          obj.updatetext(true);
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "images/mic_full.svg",
                            height: 15.h,
                            width: 18.w,
                            color: primaryColor,
                          ),
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
                ),
              ),
              Obx(
                () => Expanded(
                  child: SingleChildScrollView(
                    child: obj.isEmpty.value
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 335.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF8F8F8),
                                    border: Border.all(
                                      color: const Color(0xffC9C4D1),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(13.r))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    const TextWidget(
                                        text: "Verbes les plus populaires"),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.w),
                                      child: const Divider(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 22.w,
                                          right: 22.w,
                                          bottom: 30.h),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:
                                            Conjugaison1_Model.mylist.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      Conjugaison1_Model
                                                          .mylist[index].texts!,
                                                      style: TextStyle(
                                                        fontSize: 19.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      Conjugaison1_Model
                                                          .mylist[index].texts!,
                                                      style: TextStyle(
                                                        fontSize: 19.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              TextWidget(
                                text: "جَعَلَ - يَجْعَلُ",
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 570.h,
                                width: 335.w,
                                // color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: 'Actif Passé ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'جَعَلَ jaʿala',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xffF37E12)))
                                        ])),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Actif Présent ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'يَجْعَلُ yajʿalu',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xffF37E12)))
                                        ])),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Impératif ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'اِجْعَلْ ijʿal',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xffF37E12))),
                                        ])),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            "images/copy.svg",
                                            height: 20.h,
                                            width: 20.w,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              Share.share(
                                                "congugate",
                                              );
                                            },
                                            child: SvgPicture.asset(
                                              "images/share.svg",
                                              height: 20.h,
                                              width: 20.w,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      width: 335.w,
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r))),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 335.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.arrow_back_ios_new,
                                                      color: textgrey,
                                                      size: 15.sp,
                                                    ),
                                                  ),
                                                  TextWidget(
                                                    text: "Present tense",
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: textgrey,
                                                      size: 15.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            ListView.builder(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: Conjugaison2_Model
                                                  .list.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            Conjugaison2_Model
                                                                .list[index]
                                                                .texts!,
                                                            style: TextStyle(
                                                              fontSize: 19.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 30.h,
                                                          ),
                                                          Container(
                                                            height: 50.h,
                                                            width: 120.w,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            11.r))),
                                                            child: Center(
                                                              child: Text(
                                                                Conjugaison2_Model
                                                                    .list[index]
                                                                    .button_texts!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
