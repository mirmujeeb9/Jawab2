import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.labelText,
      this.color,
      this.filledColor,
      this.hint,
      this.prefixIcon,
      this.onFieldSubmitted,
      this.textInputAction,
      this.enable,
      this.maxline,
      this.focusnode,
      this.obsecure,
      this.hintTextColor,
      this.contentpadding,
      this.fontFamily,
      this.borderColor,
      this.fontSize,
      this.hintTextSize,
      this.suffixIcon,
      this.inputFormatters,
      this.borderRadius,
      this.fontWeight,
      this.hintFontWeight,
      this.onChanged,
      this.onTap});
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final Widget? prefixIcon;
  final Color? color;
  final EdgeInsets? contentpadding;
  final bool? enable;
  final int? maxline;
  final Color? filledColor;
  final String? hint;
  final FocusNode? focusnode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? hintTextColor;
  final String? fontFamily;
  final Color? borderColor;
  final double? fontSize;
  final double? hintTextSize;
  final double? borderRadius;
  final Widget? suffixIcon;
  final FontWeight? fontWeight;
  final FontWeight? hintFontWeight;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obsecure;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.disabled,
      maxLines: maxline ?? 1,
      focusNode: focusnode,
      enabled: true,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      obscureText: obsecure ?? false,
      style: TextStyle(
        fontSize: fontSize ?? 15.sp,
        fontFamily: fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w400,
        color: Colors.black,
      ),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
          fontFamily: fontFamily ?? 'Poppins',
          fontSize: 10.sp,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: color ?? Colors.white,
        isDense: true,
        contentPadding: contentpadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        hintStyle: TextStyle(
            color: hintTextColor ?? Colors.grey,
            fontFamily: fontFamily ?? 'Poppins',
            fontSize: hintTextSize ?? 13.sp,
            fontWeight: hintFontWeight ?? FontWeight.w400),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.1.w),
        ),
      ),
    );
  }
}
