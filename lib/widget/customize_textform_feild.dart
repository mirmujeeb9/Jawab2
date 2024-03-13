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
      enabled: enable ?? true,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      obscureText: obsecure ?? false,
      style: TextStyle(
        fontSize: fontSize ?? 15.sp,
        fontFamily: fontFamily ?? 'Cairo',
        fontWeight: fontWeight ?? FontWeight.w400,
        color: Colors.black,
      ),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
          fontFamily: fontFamily ?? 'Cairo',
          fontSize: 10.sp,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: contentpadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: fontFamily ?? 'Cairo',
            fontSize: hintTextSize ?? 14.sp,
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
          borderSide: const BorderSide(
            color: Colors.grey,
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

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  final double contentPadding;
  // final double borderRadius;
  final Color borderColor;
  final Color focusBorderColor;
  final Color errorBorderColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool? psdObs;
  final String? obscuringCharacter;
  final Widget? suffix;
  final Widget? prefix;
  void Function()? onTap;
  void Function(String)? onChanged;
  final double? margin;
  // final String label;
  final Iterable<String>? autofillHints;
  final TapRegionCallback? onTapOutside;
  final TextInputAction? textInputAction;

  AppTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.suffix,
      this.prefix,
      this.onTap,
      this.onChanged,
      required this.borderColor,
      required this.focusBorderColor,
      // required this.label,
      // required this.borderRadius,
      this.obscuringCharacter,
      this.errorBorderColor = Colors.red,
      this.contentPadding = 10,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.psdObs,
      this.margin,
      this.autofillHints,
      this.onTapOutside,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: psdObs ?? false,
      obscuringCharacter: obscuringCharacter ?? '•',
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(
          color: Color(0xffBBBBBC),
          fontWeight: FontWeight.normal,
        ),
        // label: Text(label),
        contentPadding: EdgeInsets.all(contentPadding),
        border: InputBorder.none,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        fillColor: Colors.white,
        // suffixIconColor: onPrimary,
        enabledBorder: _outlineInputBorder(borderColor),
        focusedBorder: _outlineInputBorder(focusBorderColor),
        errorBorder: _outlineInputBorder(errorBorderColor),
        focusedErrorBorder: _outlineInputBorder(errorBorderColor),
      ),
      validator: validator,
      textInputAction: textInputAction,
      onTapOutside: onTapOutside ?? (_) => FocusScope.of(context).unfocus(),
    );
  }
}

OutlineInputBorder _outlineInputBorder(borderColor) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(10.r));
}
