import 'package:alxza/view/home/edit_profile/controller.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Edit_profile_controller>(initState: (context) {
        Get.put(Edit_profile_controller());
      }, builder: (obj) {
        return SizedBox(
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
                      text: "Profile",
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
                        Icons.mode_edit_outlined,
                        size: 20.sp,
                        color: const Color(0xffAAAAAA),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35.h,
                //color: Colors.amber,
              ),
              Stack(
                children: [
                  Container(
                    height: 120.h,
                    width: 110.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/ikram.png")),
                        color: Colors.white,
                        shape: BoxShape.circle),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 80.h, left: 65.w),
                      child: Container(
                        height: 40.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0.w,
                          ),
                        ),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
