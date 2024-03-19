import 'package:alxza/view/home/history/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<HistoryController>(builder: (obj) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          // shrinkWrap: true,
          itemCount: obj.historylist.length,
          itemBuilder: (context, index) {
            HistoryModel model = obj.historylist[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Container(
                height: 70.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: primaryColor,
                ),
                child: Dismissible(
                    background: stackBehindDismiss(),
                    secondaryBackground: secondarystackBehindDismiss(),
                    key: ObjectKey(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: const Offset(0,
                                4), // Offset from top to create a shadow from the bottom
                          ),
                        ],
                      ),
                      height: 70.h,
                      width: 335.w,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          model.icon!,
                        ),
                        title: TextWidget(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                          text: model.title!,
                        ),
                        subtitle: TextWidget(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          color: Colors.grey,
                          text: model.date!,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 15.h,
                        ),
                        onTap: () {
                          // Add your onTap functionality here
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        print("Add to favorite");
                      } else {
                        print('Remove item');
                      }
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        // if (filteredDocs.length == 1) {
                        //   obj.flasstatus =
                        //       "You can\'t delete last item";
                        //   obj.update();
                        //   return null;
                        // } else {
                        //   obj.showdeleteitemDialog(
                        //       context, height, width, model.id!);
                        // }
                      } else {
                        // obj.showupdateitemDialog(
                        //     context, height, width, model.id!);
                      }

                      return null;
                    }),
              ),
            );
          },
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
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            "images/Delete.svg",
            color: Colors.white,
          ),
        ),
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
