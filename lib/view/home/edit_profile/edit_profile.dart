import 'package:alxza/view/home/edit_profile/controller.dart';
import 'package:alxza/view/home/edit_profile/image_botom_sheet.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<Edit_profile_controller>(
          initState: (context) {},
          builder: (obj) {
            return SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      CustomAppBar(
                        text: "Profile",
                        leading: true,
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
                              "images/Edit.svg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 70.h,
                        width: 70.w,
                        child: Stack(
                          children: [
                            GetBuilder<Edit_profile_controller>(
                                id: 'image',
                                builder: (image) {
                                  return Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                        image: image.image != null
                                            ? DecorationImage(
                                                image: FileImage(image.image!))
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    "images/male.png")),
                                        shape: BoxShape.circle),
                                  );
                                }),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                      ImagePickerCategory(onCloseBtnClick: () {
                                        Get.back();
                                      }, onGalleryBtnClick: () {
                                        obj.getImage(
                                            source: ImageSource.gallery);
                                        Get.back();
                                      }, oncameraBtnClick: () {
                                        obj.getImage(
                                            source: ImageSource.camera);
                                        Get.back();
                                      }),
                                      isScrollControlled: true);
                                },
                                child: Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "images/Edit.svg",
                                      color: Colors.white,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: "Full Name",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image(
                              width: 5.w,
                              height: 5.h,
                              image: const AssetImage("images/person.png"),
                            ),
                          ),
                          hint: "Hasan Mahmud",
                          fontFamily: 'Poppins',
                          controller: obj.fullnamecontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter Full Name";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: "Email",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image(
                              width: 5.w,
                              height: 5.h,
                              image: const AssetImage("images/email.png"),
                            ),
                          ),
                          hint: "example@gmail.com",
                          fontFamily: 'Poppins',
                          controller: obj.emailcontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter email";
                            }
                            if (!obj.emailRegex.hasMatch(v)) {
                              return "Please enter valid email";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: "Phone",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          hint: "+880173912-8899",
                          fontFamily: 'Poppins',
                          keyboardType: TextInputType.number,
                          controller: obj.phonecontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter Phone";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: "Location",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          hint: "Sai Can, Vietnam",
                          fontFamily: 'Poppins',
                          controller: obj.locationconotroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter Location";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                              text: "Bio",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                          Subheading(
                            text: "220",
                            color: textgrey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(220),
                          ],
                          maxline: 5,
                          hint: "Start bio here...",
                          fontFamily: 'Poppins',
                          controller: obj.fullnamecontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter Location";
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
