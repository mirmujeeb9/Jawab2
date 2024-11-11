import 'package:alxza/view/home/documents/documents.dart';
import 'package:alxza/view/home/folder/controller.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  void initState() {
    FolderController.to.isdocumentclick.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<FolderController>(builder: (obj) {
        return Obx(
          () => SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: obj.isdocumentclick.value ? 0 : 20.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: obj.isdocumentclick.value ? 20.w : 0),
                    child: CustomAppBar(
                      text: "My Documents",
                      leading: true,
                      leadingOnTap: () {
                        if (obj.isdocumentclick.value) {
                          obj.updateisdocumentclick(false);
                        } else {
                          HomeController.to.selectedItemPosition.value = 0;
                        }
                      },
                      action: CustomContainer(
                        onTap: () {},
                        width: 35.w,
                        height: 35.w,
                        margin: EdgeInsets.only(bottom: 5.h),
                        borderRadius: 8.r,
                        borderColor: Colors.grey,
                        borderWidth: 1.w,
                        child: Center(
                          child: SvgPicture.asset(
                            "images/Delete.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: obj.isdocumentclick.value ? 0 : 50.h,
                  ),
                  obj.isdocumentclick.value
                      ?
                      ///////////////// documents
                      const Expanded(child: DocumentScreen())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    obj.updateisdocumentclick(true);
                                  },
                                  child: SizedBox(
                                    height: 108.h,
                                    //  color: Colors.black,
                                    child: Image.asset("images/doucoments.png"),
                                  ),
                                ),
                                TextWidget(
                                  text: "Documents",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                  Container(
                    height: obj.isdocumentclick.value ? 0 : 10.h,
                    //  color: Colors.amberAccent,
                  ),
                  obj.isdocumentclick.value
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [],
                        ),
                  obj.isdocumentclick.value ? const SizedBox() : const Spacer(),
                  obj.isdocumentclick.value
                      ? const SizedBox()
                      : Button(
                          color: primaryColor.withOpacity(0.2),
                          onTap: () {
                            HomeController.to.selectedItemPosition.value = 10;
                            // Get.to(
                            //   () => const HistoryScreen(),
                            //   transition: Transition.rightToLeft,
                            // );
                          },
                          width: 335.w,
                          textColor: primaryColor,
                          text: "History",
                          fontWeight: FontWeight.w600,
                        ),
                  obj.isdocumentclick.value
                      ? const SizedBox()
                      : SizedBox(
                          height: 50.h,
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget secondarystackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_outline_outlined,
              color: Colors.white,
            )),
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: primaryColor,
      ),
    );
  }
}
