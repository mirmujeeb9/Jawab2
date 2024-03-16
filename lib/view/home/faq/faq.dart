import 'package:alxza/view/home/faq/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<FaqController>(initState: (i) {
        FaqController.to.faqbool =
            List.generate(FaqController.to.faqlist.length, (index) => false);
      }, builder: (obj) {
        return Form(
          key: formkey,
          child: SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomAppBar(
                    action: CustomContainer(
                      onTap: () {},
                      width: 35.w,
                      height: 35.w,
                      margin: EdgeInsets.only(bottom: 5.h),
                      borderRadius: 8.r,
                      borderColor: Colors.grey,
                      borderWidth: 1.w,
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          color: textgrey,
                        ),
                      ),
                    ),
                    text: "FAQs",
                    leading: true,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    shrinkWrap: true,
                    children: List.generate(
                      obj.faqlist.length,
                      (index) => ExpansionTile(
                        tilePadding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        collapsedShape: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 2.w),
                        ),
                        shape: const Border(),
                        trailing: const SizedBox(),
                        leading: Icon(
                          obj.faqbool[index] ? Icons.minimize : Icons.add,
                          color: blackColor,
                        ),
                        title: TextWidget(
                          text: obj.faqlist[index].question!,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        onExpansionChanged: (expanded) {
                          setState(() {
                            obj.faqbool[index] = expanded;
                            obj.faqlist[index].isExpanded = expanded;
                          });
                        },
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, bottom: 10.h, top: 10.h),
                            child: TextWidget(
                              text: obj.faqlist[index].answer!,
                              textAlign: TextAlign.justify,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: textgrey,
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
