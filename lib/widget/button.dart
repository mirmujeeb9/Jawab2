import 'package:alxza/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'text_widget.dart';

class Button extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  final Widget? child;
  final FontWeight? fontWeight;
  final double? fontsize;
  final Color? textColor;
  final double? borderWidth;
  const Button(
      {super.key,
      this.color,
      this.text,
      this.onTap,
      this.width,
      this.height,
      this.borderColor,
      this.borderRadius,
      this.child,
      this.fontsize,
      this.textColor,
      this.fontWeight,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      width: width ?? ScreenUtil().screenWidth,
      height: height ?? 50.w,
      borderRadius: borderRadius ?? 60.r,
      color: color ?? primaryColor,
      borderColor: borderColor ?? Colors.transparent,
      borderWidth: borderWidth ?? 0.w,
      child: child ??
          Center(
            child: TextWidget(
              text: text ?? '',
              fontSize: fontsize ?? 16.sp,
              color: textColor ?? whiteColor,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
          ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String imagePath;

  bool? apple;

  CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.apple,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 351.w,
        height: 55.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.r),
            color: whiteColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 25.w,
              child: Padding(
                padding: EdgeInsets.all(apple == true ? 1 : 0),
                child: Image.asset(
                  imagePath,
                  color: apple == true ? blackColor : null,

                  // fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            TextWidget(
              text: text,
              color: blackColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
