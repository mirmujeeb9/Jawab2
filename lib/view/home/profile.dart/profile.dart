import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/profile.dart/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<ProfileController>(builder: (obj) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomAppBar(
                text: "Settings",
                leading: true,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomContainer(
                      onTap: () {},
                      width: 335.w,
                      color: whiteColor,
                      borderRadius: 13.r,
                      margin: EdgeInsets.only(bottom: 8.h),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.07),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        leading: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Image.asset(
                              "images/male.png",
                            ),
                          ),
                        ),
                        title: TextWidget(
                          text: "Andren Alison",
                          color: textdarkgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            Subheading(
                              text: "andrenalison@gmail.com",
                              color: textgrey,
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 17.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      itemCount: obj.tabsList.length,
                      itemBuilder: (context, index) {
                        TabModel model = obj.tabsList[index];

                        return index != 3
                            ? CustomListTileWidget(
                                image: model.image!,
                                title: model.name!,
                                onTap: () {})
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: CustomContainer(
                                  onTap: () {},
                                  height: 55.h,
                                  width: 335.w,
                                  color: whiteColor,
                                  borderRadius: 11.r,
                                  boxShadow: [
                                    BoxShadow(
                                      color: blackColor.withOpacity(0.07),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  child: ListTile(
                                    // contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                                    leading: SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          model.image!,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: model.name!,
                                          color: textdarkgrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        Subheading(
                                          text: "English (US)",
                                          color: textgrey,
                                        ),
                                      ],
                                    ),

                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 15.h,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),

                    /// pro banner

                    CustomContainer(
                      onTap: () {},
                      width: 335.w,
                      color: primaryColor,
                      borderRadius: 13.r,
                      margin: EdgeInsets.only(bottom: 8.h),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.07),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        leading: SizedBox(
                          height: 100.h,
                          width: 70.w,
                          child: Stack(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  "images/meta.svg",
                                ),
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "images/star.svg",
                                  height: 45.h,
                                  width: 45.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: TextWidget(
                          text: "Upgrade to Pro!",
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            TextWidget(
                              text: "Offer includes first month free of charge",
                              color: whiteColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const CustomListTileWidget({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: CustomContainer(
        onTap: onTap,
        height: 55.h,
        width: 335.w,
        color: whiteColor,
        borderRadius: 11.r,
        // padding: const EdgeInsets.symmetric(),
        // margin: EdgeInsets.only(bottom: 8.h),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          leading: SizedBox(
            height: 30.h,
            width: 30.w,
            child: Center(
              child: SvgPicture.asset(
                image,
                color: Colors.black,
              ),
            ),
          ),
          title: TextWidget(
            text: title,
            color: textdarkgrey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          subtitle: subtitle == null
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Subheading(
                      text: subtitle!,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 15.h,
          ),
        ),
      ),
    );
  }
}
