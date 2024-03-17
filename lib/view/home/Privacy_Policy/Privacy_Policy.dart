import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  ScrollController controller = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBar(
                  text: "Privacy Policy",
                  leading: true,
                ),

                // TextWidget(
                //   text: "Or continue with",
                //   fontSize: 13.sp,
                //   color: Colors.grey,
                //   fontWeight: FontWeight.w400,
                // ),

                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 14.h,
                      width: 14.w,
                      child: SvgPicture.asset(
                          width: 14.w, height: 14.h, "images/back.svg"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextWidget(
                      text: "Conditions Générales d'Utilisation",
                      fontSize: 16.sp,
                      color: const Color(0xff525252),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Container(
                    height: 268.94.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            color: const Color(0xffD9D9D9), width: 1.w),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 227.58.h,
                          width: 280.24.w,
                          child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                              trackVisibility: MaterialStateProperty.all(true),
                              interactive: true,
                              // radius: const Radius.circular(10.0),

                              // trackColor: MaterialStateProperty.all(textgrey),
                              trackColor: MaterialStatePropertyAll(
                                  Colors.grey.shade300),

                              // thickness: MaterialStateProperty.all(5.0),
                              // minThumbLength: 100,

                              thumbColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Scrollbar(
                              controller: controller,
                              thumbVisibility: true,
                              child: ListView(
                                controller: controller,
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.only(right: 10.w),
                                children: [
                                  TextWidget(
                                    text:
                                        "En accédant ou en utilisant Jawab.io, nos interfaces de programmation d'applications, nos logiciels associés, sites web, outils, services de développement, données, interfaces utilisateur et de design ou documentation (collectivement, 'Jawab'), vous acceptez d'être légalement lié par ce dernier et de vous conformer aux présentes conditions, ainsi qu'à toutes les politiques, directives ou accords référencés, toute documentation relative à votre utilisation de Jawab, et toutes les En accédant ou en utilisant Jawab.io, nos interfaces de programmation d'applications, nos logiciels associés, sites web, outils, services de développement, données, interfaces utilisateur et de design ou documentation (collectivement, 'Jawab'), vous acceptez d'être légalement lié par ce dernier et de vous conformer aux présentes conditions, ainsi qu'à toutes les politiques, directives ou accords référencés, toute documentation relative à votre utilisation de Jawab, et toutes les",
                                    fontSize: 13.sp,
                                    color: const Color(0xff525252),
                                    textAlign: TextAlign.justify,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 14.h,
                      width: 14.w,
                      child: SvgPicture.asset(
                          width: 14.w, height: 14.h, "images/back.svg"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextWidget(
                      text: "Politique de Confidentialité",
                      fontSize: 16.sp,
                      color: const Color(0xff525252),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),

                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Container(
                    height: 268.94.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            color: const Color(0xffDDDDDD), width: 1.w),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 227.58.h,
                          width: 280.24.w,
                          child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                              trackVisibility: MaterialStateProperty.all(true),
                              interactive: true,
                              // radius: const Radius.circular(10.0),

                              // trackColor: MaterialStateProperty.all(textgrey),
                              trackColor: MaterialStatePropertyAll(
                                  Colors.grey.shade300),

                              // thickness: MaterialStateProperty.all(5.0),
                              // minThumbLength: 100,

                              thumbColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            child: Scrollbar(
                              controller: controller,
                              thumbVisibility: true,
                              child: ListView(
                                  // controller: controller,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(right: 10.w),
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: "Qui nous sommes ",
                                          fontSize: 13.sp,
                                          color: const Color(0xff525252),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        TextWidget(
                                          text:
                                              "Notre adresse de site Web est : https://www.jawab.io.",
                                          fontSize: 13.sp,
                                          color: const Color(0xff525252),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextWidget(
                                          text: "Commentaires",
                                          fontSize: 13.sp,
                                          color: const Color(0xff525252),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        TextWidget(
                                          text:
                                              "Lorsque les visiteurs laissent des commentaires sur le site, nous recueillons les données affichées dans le formulaire de commentaires, ainsi que l'adresse IP du visiteur et la chaîne de l'agent utilisateur du navigateur pour aider à la détection des spams. Lorsque les visiteurs laissent des commentaires sur le site, nous recueillons les données affichées dans le formulaire de commentaires, ainsi que l'adresse IP du visiteur et la chaîne de l'agent utilisateur du navigateur pour aider à la détection des ",
                                          fontSize: 13.sp,
                                          color: const Color(0xff525252),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
