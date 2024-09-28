// import 'package:alxza/view/home/conjugaison%201/model.dart';
// import 'package:alxza/widget/button.dart';
// import 'package:alxza/widget/colors.dart';
// import 'package:alxza/widget/custom_appbar.dart';
// import 'package:alxza/widget/customize_textform_feild.dart';
// import 'package:alxza/widget/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class Conjugaison_2 extends StatefulWidget {
//   const Conjugaison_2({super.key});

//   @override
//   State<Conjugaison_2> createState() => _Conjugaison_2State();
// }

// class _Conjugaison_2State extends State<Conjugaison_2> {
//   TextEditingController entercontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: ScreenUtil().screenHeight,
//         width: ScreenUtil().screenWidth,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.w),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const CustomAppBar(
//                   text: "Arabic Conjugation",
//                   leading: true,
//                 ),
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 SizedBox(
//                   width: 335.w,
//                   child: CustomTextFormField(
//                     suffixIcon: GestureDetector(
//                       onTap: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SvgPicture.asset(
//                           "images/mic_full.svg",
//                           height: 15.h,
//                           width: 18.w,
//                           color: primaryColor,
//                         ),
//                       ),
//                     ),
//                     color: const Color(0xffF3F0F3),
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(128),
//                     ],
//                     hint: "جَعَلَ",
//                     hintTextColor: blackColor,
//                     hintTextSize: 19.sp,
//                     fontFamily: 'Poppins',
//                     controller: entercontroller,
//                     validator: (v) {
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 TextWidget(
//                   text: "جَعَلَ - يَجْعَلُ",
//                   fontSize: 19.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 SizedBox(
//                   height: 570.h,
//                   width: 335.w,
//                   // color: Colors.blue,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                           text: const TextSpan(
//                               text: 'Actif Passé ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 15,
//                                   color: Colors.black),
//                               children: <TextSpan>[
//                             TextSpan(
//                                 text: 'جَعَلَ jaʿala',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                     color: Color(0xffF37E12)))
//                           ])),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       RichText(
//                           text: const TextSpan(
//                               text: 'Actif Présent ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 15,
//                                   color: Colors.black),
//                               children: <TextSpan>[
//                             TextSpan(
//                                 text: 'يَجْعَلُ yajʿalu',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                     color: Color(0xffF37E12)))
//                           ])),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       RichText(
//                           text: const TextSpan(
//                               text: 'Impératif ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 15,
//                                   color: Colors.black),
//                               children: <TextSpan>[
//                             TextSpan(
//                                 text: 'اِجْعَلْ ijʿal',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                     color: Color(0xffF37E12))),
//                           ])),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               "images/copy.svg",
//                               height: 20.h,
//                               width: 18.w,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               "images/share.svg",
//                               height: 17.h,
//                               width: 15.w,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Container(
//                         height: 375.h,
//                         width: 335.w,
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 244, 238, 238),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(8.r))),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             SizedBox(
//                               height: 30.h,
//                               width: 335.w,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Icon(
//                                     Icons.arrow_back_ios_new,
//                                     color: primaryColor,
//                                   ),
//                                   const TextWidget(
//                                     text: "Present tense",
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                   Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: primaryColor,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 22.w),
//                               child: ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 shrinkWrap: true,
//                                 itemCount: Conjugaison2_Model.list.length,
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               Conjugaison2_Model
//                                                   .list[index].texts!,
//                                               style: TextStyle(
//                                                 fontSize: 19.sp,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 30.h,
//                                             ),
//                                             Container(
//                                               height: 50.h,
//                                               width: 120.w,
//                                               decoration: BoxDecoration(
//                                                   color: primaryColor,
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(
//                                                               11.r))),
//                                               child: Center(
//                                                 child: Text(
//                                                   Conjugaison2_Model.list[index]
//                                                       .button_texts!,
//                                                   style: TextStyle(
//                                                     fontSize: 13.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 256.h,
//                   width: 335.w,
//                   decoration: BoxDecoration(
//                       color: Colors.deepOrange,
//                       borderRadius: BorderRadius.all(Radius.circular(26.r))),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       TextWidget(
//                         text:
//                             "You don’t have enough\ncredit to use Jawab,\nplease reload  to add\nmore credit on your\naccount",
//                         textAlign: TextAlign.center,
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       Button(
//                         onTap: () {
//                           // if (formkey.currentState!.validate()) {
//                           // Get.to(     HomeScreen(),
//                           //     transition: Transition.rightToLeft);
//                           // }
//                         },
//                         width: 218.w,
//                         height: 36.h,
//                         text: "Reload",
//                         fontsize: 13.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   height: 256.h,
//                   width: 335.w,
//                   decoration: BoxDecoration(
//                       color: Colors.deepOrange,
//                       borderRadius: BorderRadius.all(Radius.circular(26.r))),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       TextWidget(
//                         text: "Credit",
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Stack(
//                             children: [
//                               Column(
//                                 children: [
//                                   Image.asset(
//                                     "images/token.png",
//                                     height: 56.h,
//                                     width: 57.w,
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   TextWidget(
//                                     text: "106 350 / 250 000\ntokens",
//                                     fontSize: 9,
//                                     fontWeight: FontWeight.w600,
//                                     color: primaryColor,
//                                     textAlign: TextAlign.center,
//                                   )
//                                 ],
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 30.h, left: 32.w),
//                                 child: Container(
//                                   height: 33.h,
//                                   width: 33.w,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: Colors.white),
//                                       color: primaryColor,
//                                       shape: BoxShape.circle),
//                                   child: SvgPicture.asset(
//                                     "images/text_T.svg",
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Stack(
//                             children: [
//                               Column(
//                                 children: [
//                                   Image.asset(
//                                     "images/token.png",
//                                     height: 56.h,
//                                     width: 57.w,
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   TextWidget(
//                                     text: "46 minutes\nleft",
//                                     fontSize: 9,
//                                     fontWeight: FontWeight.w600,
//                                     color: primaryColor,
//                                     textAlign: TextAlign.center,
//                                   )
//                                 ],
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 30.h, left: 25.w),
//                                 child: Container(
//                                   height: 33.h,
//                                   width: 33.w,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: Colors.white),
//                                       color: primaryColor,
//                                       shape: BoxShape.circle),
//                                   child: SvgPicture.asset(
//                                     "images/time.svg",
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Button(
//                         onTap: () {
//                           // if (formkey.currentState!.validate()) {
//                           // Get.to(     HomeScreen(),
//                           //     transition: Transition.rightToLeft);
//                           // }
//                         },
//                         width: 218.w,
//                         height: 36.h,
//                         text: "Reload",
//                         fontsize: 13.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
