import 'package:alxza/view/home/affiliate/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AffiliateScreen extends StatefulWidget {
  const AffiliateScreen({super.key});

  @override
  State<AffiliateScreen> createState() => _AffiliateScreenState();
}

class _AffiliateScreenState extends State<AffiliateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<AffiliateController>(
          initState: (context) {},
          builder: (obj) {
            return SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: const CustomAppBar(
                      text: "Affiliate",
                      leading: true,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Container(
                                // height: 390.h,
                                width: 335.54.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: primaryColor),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25.h),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text: "Earnings",
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text: "Basic chat functionality",
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text: "50 €",
                                            fontSize: 35.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text:
                                                "Comission Rate: 10%\nReferral Program: All Purchases",
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        height: 1.h,
                                        width: 283.w,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text:
                                                "Invite your friends and earn lifelong\nrecurring commissions from every\npurchase they make 🎁",
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextWidget(
                                            text: "Affiliate Link",
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                        width: 284.w,
                                        child: CustomTextFormField(
                                            contentpadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 20.w,
                                                    vertical: 10.h),
                                            hint: "...aff=P60NPGHAAFGD",
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                  width: 5.w,
                                                  height: 5.h,
                                                  "images/copy.svg"),
                                            ),
                                            fontFamily: 'Poppins',
                                            controller: obj.affiliatecontroler,
                                            validator: (v) {
                                              return null;
                                              //   if (v!.isEmpty) {
                                              //     return "Please enter Full Name";
                                            }
                                            //   return null;
                                            // },
                                            ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            // height: 466.85.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      TextWidget(
                                        text: "How it Works",
                                        fontSize: 18.sp,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 32.h,
                                        width: 32.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff241649)),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextWidget(
                                        text:
                                            "You send your invitation link to your\nfriends.",
                                        fontSize: 13.sp,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 32.h,
                                        width: 32.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff241649)),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextWidget(
                                        text:
                                            "They subscribe to a paid plan by using\nyour referral link.",
                                        fontSize: 13.sp,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 32.h,
                                        width: 32.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff241649)),
                                        child: Center(
                                          child: Text(
                                            '3',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextWidget(
                                        text:
                                            "From their first purchase, you will begin\nearning recurring commissions.",
                                        fontSize: 13.sp,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      TextWidget(
                                        text: "Affiliate Link",
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 301.w,
                                    child: CustomTextFormField(
                                        hint: "Email address",
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                              width: 5.w,
                                              height: 5.h,
                                              "images/copy.svg"),
                                        ),
                                        fontFamily: 'Poppins',
                                        controller: obj.emailcontroler,
                                        validator: (v) {
                                          return null;
                                          //   if (v!.isEmpty) {
                                          //     return "Please enter Full Name";
                                        }
                                        //   return null;
                                        // },
                                        ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Button(
                                    onTap: () {},
                                    width: 301.55.w,
                                    text: "Send",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            // height: 466.85.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.h),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: 30.h,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      TextWidget(
                                        text: "Withdrawal Form",
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      TextWidget(
                                        text: "Your Bank Information",
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 301.w,
                                    child: CustomTextFormField(
                                        maxline: 4,
                                        hint:
                                            "Bank of America - 2382372329 3843749 2372379",
                                        fontFamily: 'Poppins',
                                        controller: obj.bankinfocontroler,
                                        validator: (v) {
                                          return null;
                                          //   if (v!.isEmpty) {
                                          //     return "Please enter Full Name";
                                        }
                                        //   return null;
                                        // },
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 35.w,
                                      ),
                                      TextWidget(
                                        text: "Amount",
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 301.w,
                                    child: CustomTextFormField(
                                        hint: "Minimum Withdrawal Amount is 10",
                                        fontFamily: 'Poppins',
                                        controller: obj.amountcontroler,
                                        validator: (v) {
                                          return null;
                                          //   if (v!.isEmpty) {
                                          //     return "Please enter Full Name";
                                        }
                                        //   return null;
                                        // },
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Button(
                                    onTap: () {},
                                    width: 301.55.w,
                                    text: "Send Request",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
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
