import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payment_method extends StatefulWidget {
  const Payment_method({super.key});

  @override
  State<Payment_method> createState() => _Payment_methodState();
}

class _Payment_methodState extends State<Payment_method> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {},
        child: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    text: "Payment Method",
                    leading: true,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Container(
                      height: 70.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          )),
                      child: Row(
                        children: [
                          Container(
                            width: 20.w,
                            //   color: Colors.black45,
                          ),
                          SizedBox(
                              height: 30.h,
                              width: 50.w,
                              child: Image.asset("images/payment_method.png")),
                          Container(
                            width: 15.w,
                            //  color: Colors.black45,
                          ),
                          TextWidget(
                            text: "Credit Card",
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    // color: Colors.black45,
                  ),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Container(
                      height: 70.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          )),
                      child: Row(
                        children: [
                          Container(
                            width: 30.w,
                            // color: Colors.black45,
                          ),
                          SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: Image.asset(
                                "images/paypal.png",
                                fit: BoxFit.cover,
                              )),
                          Container(
                            width: 20.w,
                            //  color: Colors.black45,
                          ),
                          TextWidget(
                            text: "Paypal",
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    // color: Colors.black45,
                  ),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Container(
                      height: 70.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          )),
                      child: Row(
                        children: [
                          Container(
                            width: 25.w,
                            //  color: Colors.black45,
                          ),
                          SizedBox(
                            height: 15.h,
                            width: 49.87.w,
                            // color: Colors.black12,
                            child: Image.asset(
                              "images/visa.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 10.w,
                            //  color: Colors.black45,
                          ),
                          TextWidget(
                            text: "Visa",
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    // color: Colors.black45,
                  ),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Container(
                      height: 70.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          )),
                      child: Row(
                        children: [
                          Container(
                            width: 30.w,
                            //  color: Colors.black45,
                          ),
                          SizedBox(
                            height: 30.h,
                            width: 30.w,
                            // color: Colors.black12,
                            child: Image.asset(
                              "images/google.png",
                            ),
                          ),
                          Container(
                            width: 25.w,
                            //  color: Colors.black45,
                          ),
                          TextWidget(
                            text: "Google Pays",
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    // color: Colors.black45,
                  ),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Container(
                      height: 70.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.r))),
                          ),
                          Container(
                            width: 25.w,
                            color: Colors.black45,
                          ),
                          Center(
                            child: TextWidget(
                              text: "Add Card",
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
