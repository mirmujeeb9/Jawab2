import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RightMenue extends StatelessWidget {
  const RightMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffC3C1C3),
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25.r,
            ),
          ),
          child: Container(
            height: 441.h,
            width: 335.w,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                25.r,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 120.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 10.h,
                    ),
                    itemCount: HomeController.to.tabsList.length,
                    itemBuilder: (c, index) {
                      TabModel model = HomeController.to.tabsList[index];
                      return Obx(
                        () => InkWell(
                          onTap: () {
                            HomeController.to.tabIndex.value = index;
                            Future.delayed(Duration(milliseconds: 200), () {
                              HomeController.to.selectedItemPosition.value =
                                  index + 4;
                            });
                            // Get.back();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 5,
                                shape: const CircleBorder(),
                                child: Container(
                                  height: 75.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      color: HomeController.to.tabIndex.value ==
                                              index
                                          ? textgrey
                                          : primaryColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Image.asset(
                                      model.image!,
                                      height: 40.h,
                                      width: 40.w,
                                    ),
                                  ),
                                ),
                              ),
                              TextWidget(
                                textAlign: TextAlign.center,
                                text: model.name!,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
