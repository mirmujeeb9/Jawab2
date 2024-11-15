import 'package:alxza/view/auth/forgot_password/verified/verified_screen.dart';
import 'package:alxza/view/home/payment_method/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Payment_method extends StatefulWidget {
  const Payment_method({super.key});

  @override
  State<Payment_method> createState() => _Payment_methodState();
}

class _Payment_methodState extends State<Payment_method> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    PaymentController.to.selectedIndex.value = 10;
    PaymentController.to.addcardClick.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => PaymentController.to.addcardClick.value
            ? SizedBox(
                width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        onTap: () {
                          PaymentController.to.updateselectedIndex(10);
                          PaymentController.to.updateaddcardClick(false);
                        },
                        width: 160.w,
                        borderRadius: 11.r,
                        text: "Cancel",
                        color: primaryColor.withOpacity(0.2),
                        fontWeight: FontWeight.w500,
                        textColor: primaryColor,
                      ),
                      Button(
                        onTap: () {
                          PaymentController.to.updateselectedIndex(10);
                          PaymentController.to.updateaddcardClick(false);

                          Get.to(
                            () => const VerifiedScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        width: 160.w,
                        borderRadius: 11.r,
                        text: "Confirm",
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ),
      body: GetBuilder<PaymentController>(builder: (obj) {
        return SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  text: "Payment Method",
                  leading: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Column(
                          children: List.generate(
                            obj.paymentList.length,
                            (index) => Obx(
                              () => Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: Card(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.r),
                                        ),
                                      ),
                                      child: Container(
                                        height: 70.h,
                                        width: 335.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.r),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            obj.updateselectedIndex(index);
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 20.w,
                                                //   color: Colors.black45,
                                              ),
                                              SizedBox(
                                                height: 30.h,
                                                width: 50.w,
                                                child: Image.asset(obj
                                                    .paymentList[index].image!),
                                              ),
                                              Container(
                                                width: 15.w,
                                                //  color: Colors.black45,
                                              ),
                                              TextWidget(
                                                text: obj
                                                    .paymentList[index].name!,
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 20.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 2.w,
                                                    color: obj.selectedIndex
                                                                .value ==
                                                            index
                                                        ? primaryColor
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: obj.selectedIndex
                                                              .value ==
                                                          index
                                                      ? Icon(
                                                          Icons.circle,
                                                          size: 12.sp,
                                                          color: primaryColor,
                                                        )
                                                      : null,
                                                ),
                                              ),
                                              Container(
                                                width: 15.w,
                                                //  color: Colors.black45,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///////// save card
                                  index == obj.selectedIndex.value &&
                                          obj.addcardClick.value
                                      ? Card(
                                          elevation: 6,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.r))),
                                          child: Container(
                                            width: 335.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30.r),
                                                )),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 25.h,
                                                  horizontal: 20.w),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      TextWidget(
                                                        text:
                                                            "Card Holder Name",
                                                        color: Colors.black,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      TextWidget(
                                                        text: "*",
                                                        color: Colors.red,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  SizedBox(
                                                    width: 335.w,
                                                    child: CustomTextFormField(
                                                      color:
                                                          Colors.grey.shade300,
                                                      hint: "Card Holder Name",
                                                      controller:
                                                          obj.cardholdername,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please enter card holder name";
                                                        }

                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextWidget(
                                                        text: "Card Number",
                                                        color: Colors.black,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      TextWidget(
                                                        text: "*",
                                                        color: Colors.red,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  SizedBox(
                                                    width: 335.w,
                                                    child: CustomTextFormField(
                                                      suffixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          height: 10.h,
                                                          width: 10.w,
                                                          child: Image.asset(obj
                                                              .paymentList[
                                                                  index]
                                                              .image!),
                                                        ),
                                                      ),
                                                      color:
                                                          Colors.grey.shade300,
                                                      hint:
                                                          "xxxx-xxxx-xxxx-xxxx",
                                                      controller: obj.cardno,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please enter card number";
                                                        }

                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text:
                                                                    "Exp Date",
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              TextWidget(
                                                                text: "*",
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          SizedBox(
                                                            width: 140.w,
                                                            child:
                                                                CustomTextFormField(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              hint: "xx/xx",
                                                              controller:
                                                                  obj.expdate,
                                                              validator: (v) {
                                                                if (v!
                                                                    .isEmpty) {
                                                                  return "Please enter Exp Date";
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              TextWidget(
                                                                text: "CVV",
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              TextWidget(
                                                                text: "*",
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          SizedBox(
                                                            width: 140.w,
                                                            child:
                                                                CustomTextFormField(
                                                              obsecure:
                                                                  obj.password,
                                                              suffixIcon:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  obj.password =
                                                                      !obj.password;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  obj.password
                                                                      ? Icons
                                                                          .remove_red_eye_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: Colors
                                                                      .grey,
                                                                  size: 20.sp,
                                                                ),
                                                              ),
                                                              color: Colors.grey
                                                                  .shade300,
                                                              hint: "● ● ●",
                                                              controller:
                                                                  obj.cvv,
                                                              validator: (v) {
                                                                if (v!
                                                                    .isEmpty) {
                                                                  return "Please enter cvv";
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 10.h,
                        ),
                        Obx(
                          () => obj.addcardClick.value
                              ? const SizedBox()
                              : Container(
                                  height: 50.h,
                                  width: 335.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.r),
                                    ),
                                  ),
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    dashPattern: const [8, 4],
                                    color: Colors.grey.shade400,
                                    radius: Radius.circular(15.r),
                                    child: InkWell(
                                      onTap: () {
                                        if (obj.selectedIndex.value != 10) {
                                          obj.updateaddcardClick(true);
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 30.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.r))),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 14.sp,
                                            ),
                                          ),
                                          Container(
                                            width: 15.w,
                                            // color: Colors.black45,
                                          ),
                                          Center(
                                            child: TextWidget(
                                              text: "Add Card",
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        Obx(
                          () => obj.addcardClick.value
                              ? const SizedBox()
                              : Container(
                                  height: 160.h,
                                  // color: Colors.black45,
                                ),
                        ),
                        Obx(
                          () => obj.addcardClick.value
                              ? const SizedBox()
                              : Button(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Conjugaison_1()));
                                  },
                                  width: 335.w,
                                  text: "Payment Now",
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                        Container(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
