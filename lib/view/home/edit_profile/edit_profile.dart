import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/home/edit_profile/controller.dart';
import 'package:alxza/view/home/edit_profile/image_botom_sheet.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart' as c;
import 'package:intl_phone_field/countries.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController streetconotroller = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    fullnamecontroller.dispose();
    phonecontroller.dispose();
    streetconotroller.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Edit_profile_controller.to.selectedcountry = null;
    fullnamecontroller.text = StaticData.userModel!.name;
    emailcontroller.text = StaticData.userModel!.email;
    phonecontroller.text = StaticData.userModel!.phone ?? "";
    Edit_profile_controller.to.selectedcountry = c.countries.firstWhere(
      (element) => element.name == StaticData.userModel!.country,
      orElse: () => c.countries[0],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<Edit_profile_controller>(
          initState: (context) {},
          builder: (obj) {
            return Form(
              key: formkey,
              child: SizedBox(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        CustomAppBar(
                          leadingOnTap: () {
                            HomeController.to.selectedItemPosition.value = 2;
                          },
                          text: "Profile",
                          leading: true,
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
                                  return StaticData.userModel!.avatar.isNotEmpty
                                      ? obj.image != null
                                          ? CircleAvatar(
                                              radius: 70.r,
                                              backgroundImage:
                                                  FileImage(obj.image!))
                                          : CircleAvatar(
                                              radius: 70.r,
                                              backgroundImage: NetworkImage(
                                                StaticData.userModel!.avatar
                                                            .contains(
                                                                "assets") ||
                                                        StaticData
                                                            .userModel!.avatar
                                                            .contains("upload")
                                                    ? "${StaticData.imageUrl}${StaticData.userModel!.avatar}"
                                                    : "${StaticData.userModel!.avatar}",
                                              ),
                                            )
                                      : Image.asset(
                                          "images/male.png",
                                          height: 70.h,
                                          width: 70.w,
                                        );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                        ImagePickerCategory(
                                            onCloseBtnClick: () {
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
                            controller: fullnamecontroller,
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
                            enable: false,
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
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
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
                            hint: "+33 6 06 06 06 06",
                            fontFamily: 'Poppins',
                            keyboardType: TextInputType.number,
                            controller: phonecontroller,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter Phone";
                              }

                              return null;
                            },
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // Row(
                        //   children: [
                        //     TextWidget(
                        //         text: "Street",
                        //         fontSize: 16.sp,
                        //         fontWeight: FontWeight.w500),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        // SizedBox(
                        //   width: 335.w,
                        //   child: CustomTextFormField(
                        //     hint: "1 Place du Marché",
                        //     fontFamily: 'Poppins',
                        //     controller: streetconotroller,
                        //     validator: (v) {
                        //       if (v!.isEmpty) {
                        //         return "Please enter Street";
                        //       }

                        //       return null;
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         TextWidget(
                        //             text: "Postal Code",
                        //             fontSize: 16.sp,
                        //             fontWeight: FontWeight.w500),
                        //         SizedBox(
                        //           height: 5.h,
                        //         ),
                        //         SizedBox(
                        //           width: 150.w,
                        //           child: CustomTextFormField(
                        //             keyboardType: TextInputType.number,
                        //             hint: "75001",
                        //             fontFamily: 'Poppins',
                        //             controller: postalcodecontroller,
                        //             validator: (v) {
                        //               if (v!.isEmpty) {
                        //                 return "Please enter Postal Code";
                        //               }

                        //               return null;
                        //             },
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         TextWidget(
                        //             text: "City",
                        //             fontSize: 16.sp,
                        //             fontWeight: FontWeight.w500),
                        //         SizedBox(
                        //           height: 5.h,
                        //         ),
                        //         SizedBox(
                        //           width: 150.w,
                        //           child: CustomTextFormField(
                        //             hint: "Paris",
                        //             fontFamily: 'Poppins',
                        //             controller: citycontroller,
                        //             validator: (v) {
                        //               if (v!.isEmpty) {
                        //                 return "Please enter City";
                        //               }

                        //               return null;
                        //             },
                        //           ),
                        //         ),
                        //       ],
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Row(
                          children: [
                            TextWidget(
                                text: "Country",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),

                        GetBuilder<Edit_profile_controller>(
                            id: 'country',
                            builder: (cat) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton2<Country>(
                                  isExpanded: true,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp,
                                    color: blackColor,
                                  ),
                                  isDense: true,
                                  customButton: Container(
                                    height: 50.h,
                                    width: 335.w,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: obj.selectedcountry == null
                                                ? 'Select Country'
                                                : obj.selectedcountry!.name,
                                            fontSize: 14.sp,
                                            color: obj.selectedcountry == null
                                                ? textgrey
                                                : null,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: obj.selectedcountry == null
                                                ? textgrey
                                                : primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  value: obj.selectedcountry,
                                  items: c.countries.map((Country type) {
                                    return DropdownMenuItem<Country>(
                                      value: type,
                                      child: Text(
                                        type.name,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  dropdownSearchData: DropdownSearchData(
                                    searchInnerWidgetHeight: 20.h,
                                    searchController: searchController,
                                    searchInnerWidget: TextFormField(
                                        cursorColor: primaryColor,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: primaryColor,
                                          ),
                                          // contentPadding:
                                          //     EdgeInsets.symmetric(
                                          //         horizontal:
                                          //             width * 0.05),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.5.w,
                                                color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.5.w,
                                                color: primaryColor),
                                          ),
                                        ),
                                        controller: searchController),
                                    searchMatchFn: (a, searchValue) {
                                      return a.value!.name
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchValue.toLowerCase());
                                    },
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      searchController.clear();
                                    }
                                  },
                                  onChanged: (Country? newValue) {
                                    cat.selectedcountry = newValue;

                                    cat.update(['country']);
                                  },
                                ),
                              );
                            }),

                        // SizedBox(
                        //   width: 335.w,
                        //   child: CustomTextFormField(
                        //     hint: "FRANCE",
                        //     fontFamily: 'Poppins',
                        //     controller: countrycontroller,
                        //     validator: (v) {
                        //       if (v!.isEmpty) {
                        //         return "Please enter Country";
                        //       }

                        //       return null;
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Obx(
                          () => obj.loading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: primaryColor,
                                ))
                              : Button(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      obj.updateProfile(
                                          name: fullnamecontroller.text,
                                          phone: phonecontroller.text,
                                          country: obj.selectedcountry!.name);
                                    }
                                  },
                                  width: 335.w,
                                  text: "Save",
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
