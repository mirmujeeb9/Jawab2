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
      width: width ?? ScreenUtil().screenWidth,
      height: height ?? 50.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? Colors.white,
          backgroundColor: color ?? primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 60.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
            ),
          ),
        ),
        child: child ??
            Center(
              child: Text(
                text ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: fontsize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w600,
                ),
              ),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 50.w,
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
                  height: 20.h,
                  width: 20.h,
                  // fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            HeadingSmall(
              text: text,
              color: blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
