import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: backGroundColor,
        // body: GetBuilder<AffiliateController>(
        //     initState: (context) {},
        //     builder: (obj) {
        //       return SizedBox(
        //         height: ScreenUtil().screenHeight,
        //         width: ScreenUtil().screenWidth,
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 25.w),
        //           child: const SingleChildScrollView(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 CustomAppBar(
        //                   text: "Privacy Policy",
        //                   leading: true,
        //                 ),

        //                 // TextWidget(
        //                 //   text: "Or continue with",
        //                 //   fontSize: 13.sp,
        //                 //   color: Colors.grey,
        //                 //   fontWeight: FontWeight.w400,
        //                 // ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     }),
        );
  }
}
