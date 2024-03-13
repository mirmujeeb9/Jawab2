import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History_screen extends StatefulWidget {
  const History_screen({super.key});

  @override
  State<History_screen> createState() => _History_screenState();
}

class _History_screenState extends State<History_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              width: 200.w,
              //  color: Colors.amber,
            ),
            SizedBox(
              height: 60.h,

              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.r)),
                        border: Border.all(color: const Color(0xffAAAAAA))),
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 20.sp,
                      color: const Color(0xffAAAAAA),
                    ),
                  ),
                  TextWidget(
                    text: "My Documents",
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Container(
                    height: 45.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9.r)),
                        border: Border.all(color: const Color(0xffAAAAAA))),
                    child: Icon(
                      Icons.delete_outlined,
                      size: 20.sp,
                      color: const Color(0xffAAAAAA),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.h,
              //  color: Colors.amberAccent,
            ),
            SizedBox(
              height: 185.h,
              //  color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                          //  color: Colors.black,
                          child: Image.asset("images/doucoments.png"),
                        ),
                        TextWidget(
                          text: "Documents",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 185.h,
                      //  color: Colors.red,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                            //  color: Colors.black,
                            child: Image.asset("images/doucoments.png"),
                          ),
                          TextWidget(
                            text: "Pictures",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10.h,
              //  color: Colors.amberAccent,
            ),
            SizedBox(
              height: 185.h,
              //  color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                          //  color: Colors.black,
                          child: Image.asset(
                            "images/doucoments.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        TextWidget(
                          text: "Videos",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200.h,
                      width: 130.w,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 120.h,
                            width: 110.w,
                            //color: Colors.black,
                            child: Image.asset(
                              "images/+.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextWidget(
                            text: "New Folder",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200.h,
            ),
            Button(
              color: primaryColor.withOpacity(0.2),
              onTap: () {},
              width: 360.w,
              textColor: primaryColor,
              text: "History",
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
