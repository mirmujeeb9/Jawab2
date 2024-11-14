import 'package:alxza/utilis/static_data.dart';
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
              child: CustomAppBar(
                leadingOnTap: () {
                  HomeController.to.selectedItemPosition.value = 0;
                },
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
                        onTap: () {
                          HomeController.to.selectedItemPosition.value = 12;
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        leading: (StaticData.userModel != null &&
                                StaticData.userModel!.avatar.isNotEmpty)
                            ? CircleAvatar(
                                radius: 30.r,
                                backgroundImage: NetworkImage(
                                  StaticData.userModel!.avatar
                                              .contains("assets") ||
                                          StaticData.userModel!.avatar
                                              .contains("upload")
                                      ? "${StaticData.imageUrl}${StaticData.userModel!.avatar}"
                                      : StaticData.userModel!.avatar,
                                ),
                              )
                            : Image.asset(
                                "images/male.png",
                                height: 40.h,
                                width: 40.w,
                              ),
                        title: TextWidget(
                          text: StaticData.userModel?.name ?? 'Guest User',
                          color: textdarkgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.h),
                            Subheading(
                              text: StaticData.userModel?.email ?? 'No Email',
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
                                onTap: () {
                                  if (index == 0) {
                                    HomeController
                                        .to.selectedItemPosition.value = 13;
                                  } else if (index == 1) {
                                    HomeController
                                        .to.selectedItemPosition.value = 14;
                                  } else if (index == 2) {
                                    HomeController
                                        .to.selectedItemPosition.value = 15;
                                  } else if (index == 4) {
                                    HomeController
                                        .to.selectedItemPosition.value = 16;
                                  } else if (index == 5) {
                                    HomeController
                                        .to.selectedItemPosition.value = 17;
                                  }
                                  // Get.to(
                                  //   () => index == 0
                                  //       ? const AffiliateScreen()
                                  //       : index == 1
                                  //           ? const InvoiceScreen()
                                  //           : index == 2
                                  //               ? const SecurityScreen()
                                  //               : index == 4
                                  //                   ? const PrivacyPolicyScreen()
                                  //                   : index == 5
                                  //                       ? const FaqScreen()
                                  //                       : const AffiliateScreen(),
                                  //   transition: Transition.rightToLeft,
                                  // );
                                })
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
                                        child: Image.asset(
                                          model.image!,
                                          height: 16.h,
                                          width: 16.w,
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
                        onTap: () {
                          HomeController.to.selectedItemPosition.value = 11;
                          // Get.to(
                          //   () => const Upgrade_to_pro(),
                          //   transition: Transition.rightToLeft,
                          // );
                        },
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
                          text: "Upgrade your Subscription",
                          overflow: TextOverflow.ellipsis,
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
                              text: "Choose the best for your need !",
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
