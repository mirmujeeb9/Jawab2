import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImagePickerCategory extends StatelessWidget {
  final VoidCallback oncameraBtnClick;
  final VoidCallback onGalleryBtnClick;
  final VoidCallback onCloseBtnClick;

  const ImagePickerCategory(
      {Key? key,
      required this.onCloseBtnClick,
      required this.onGalleryBtnClick,
      required this.oncameraBtnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      margin: const EdgeInsets.only(top: 70),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose image",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: onGalleryBtnClick,
                child: Text(
                  "Gallery",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: oncameraBtnClick,
                child: Text("Camera",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
