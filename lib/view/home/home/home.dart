import 'dart:ui';

import 'package:alxza/view/home/affiliate/affiliate.dart';
import 'package:alxza/view/home/edit_profile/edit_profile.dart';
import 'package:alxza/view/home/faq/faq.dart';
import 'package:alxza/view/home/folder/folder.dart';
import 'package:alxza/view/home/history/history.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/invoices/invoices.dart';
import 'package:alxza/view/home/menue/advanced_dictionary/advanced_dictionary.dart';
import 'package:alxza/view/home/menue/ai_assistant_/ai_assitent.dart';
import 'package:alxza/view/home/menue/file_analyzer/file_analyzer.dart';
import 'package:alxza/view/home/menue/menue.dart';
import 'package:alxza/view/home/menue/translator/translator.dart';
import 'package:alxza/view/home/menue/video_transcription/video_transcription.dart';
import 'package:alxza/view/home/privacy_policy/privacy_policy.dart';
import 'package:alxza/view/home/profile.dart/profile.dart';
import 'package:alxza/view/home/security/security.dart';
import 'package:alxza/view/home/upgrade_to_pro/upgrade_to_pro.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your onTap action here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your onTap action here
                Navigator.pop(context); // Close the drawer
              },
            ),
            // Add more list tiles for additional items
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (obj) {
        return Obx(
          () => Container(
            height: 70.h,
            color: whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    obj.selectedItemPosition.value = 0;
                    obj.tabIndex.value = 10;
                    _controller.reverse();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: SvgPicture.asset(
                        "images/menue.svg",
                        height: 20.h,
                        width: 20.w,
                        color: obj.selectedItemPosition.value == 0
                            ? primaryColor
                            : null,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    obj.selectedItemPosition.value = 1;
                    obj.tabIndex.value = 10;
                    _controller.reverse();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: SvgPicture.asset(
                        "images/history.svg",
                        height: 20.h,
                        width: 20.w,
                        color: obj.selectedItemPosition.value == 1
                            ? primaryColor
                            : null,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    obj.selectedItemPosition.value = 2;
                    obj.tabIndex.value = 10;
                    _controller.reverse();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: SvgPicture.asset(
                        "images/person.svg",
                        height: 20.h,
                        width: 20.w,
                        color: obj.selectedItemPosition.value == 2
                            ? primaryColor
                            : null,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // obj.selectedItemPosition.value = 4;
                    obj.tabIndex.value = 10;
                    if (_controller.isDismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    obj.updatedialogue(true);

                    showGeneralDialog(
                      useRootNavigator: true,
                      barrierLabel: "label",
                      barrierDismissible: false,
                      barrierColor: Colors.transparent,
                      transitionDuration: Duration(milliseconds: 400),
                      context: context,
                      pageBuilder: (dialogContext, anim1, anim2) {
                        return Container(
                          height: ScreenUtil().screenHeight,
                          color: Colors.transparent,
                          width: ScreenUtil().screenWidth,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 124.w,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                            HomeController.to.tabsList.length,
                                            (index) => Obx(
                                              () => GestureDetector(
                                                onTap: () {
                                                  HomeController.to.tabIndex
                                                      .value = index;
                                                  Future.delayed(
                                                      Duration(
                                                          milliseconds: 200),
                                                      () {
                                                    HomeController
                                                        .to
                                                        .selectedItemPosition
                                                        .value = index + 4;
                                                    Navigator.pop(
                                                        dialogContext);
                                                    obj.updatedialogue(false);
                                                    _controller.reverse();
                                                  });
                                                  // Get.back();
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Card(
                                                      elevation: 5,
                                                      shape:
                                                          const CircleBorder(),
                                                      child: Container(
                                                        height: 65.h,
                                                        width: 65.w,
                                                        decoration: BoxDecoration(
                                                            color: HomeController
                                                                        .to
                                                                        .tabIndex
                                                                        .value ==
                                                                    index
                                                                ? textgrey
                                                                : primaryColor,
                                                            shape: BoxShape
                                                                .circle),
                                                        child: Center(
                                                          child: Image.asset(
                                                            HomeController
                                                                .to
                                                                .tabsList[index]
                                                                .image!,
                                                            height: 35.h,
                                                            width: 35.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    TextWidget(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: HomeController
                                                          .to
                                                          .tabsList[index]
                                                          .name!,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),

                                /////////////////////
                                Container(
                                  height: 70.h,
                                  width: ScreenUtil().screenWidth,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          obj.selectedItemPosition.value = 0;
                                          Navigator.pop(dialogContext);
                                          obj.updatedialogue(false);
                                          obj.tabIndex.value = 10;
                                          _controller.reverse();
                                        },
                                        child: Container(
                                          height: 30.h,
                                          width: 30.w,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          obj.selectedItemPosition.value = 1;
                                          Navigator.pop(dialogContext);
                                          obj.updatedialogue(false);

                                          obj.tabIndex.value = 10;
                                          _controller.reverse();
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          obj.selectedItemPosition.value = 2;
                                          Navigator.pop(dialogContext);
                                          obj.updatedialogue(false);

                                          obj.tabIndex.value = 10;
                                          _controller.reverse();
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          obj.updatedialogue(false);
                                          obj.tabIndex.value = 10;
                                          _controller.reverse();
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /////////////////
                              ],
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (dialogContext, anim1, anim2, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(1, 0), end: Offset(0, 0))
                                  .animate(anim1),
                          child: child,
                        );
                      },
                    );
                    // Get.dialog(MenueDialogue(
                    //   onYesBtnClick: () {
                    //     Get.back();
                    //   },
                    // ));
                  },
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          "images/chat.png",
                          height: 30.h,
                          width: 30.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      body: GetBuilder<HomeController>(builder: (obj) {
        return Obx(
          () => Stack(
            children: [
              obj.selectedItemPosition.value == 0
                  ? const MenueScreen()
                  : obj.selectedItemPosition.value == 1
                      ? const FolderScreen()
                      : obj.selectedItemPosition.value == 2
                          ? const ProfileScreen()
                          : obj.selectedItemPosition.value == 3
                              ? Container()
                              : obj.selectedItemPosition.value == 4
                                  ? const AiassistentScreen()
                                  : obj.selectedItemPosition.value == 5
                                      ? const TranslateScreen()
                                      : HomeController.to.selectedItemPosition
                                                  .value ==
                                              6
                                          ? const AdvanceDisctionaryScreen()
                                          : obj.selectedItemPosition.value == 7
                                              ? const VideoTranscriptionScreen()
                                              : obj.selectedItemPosition
                                                          .value ==
                                                      8
                                                  ? FileAnalyzer()
                                                  //  const Conjugaison_1()
                                                  : obj.selectedItemPosition
                                                              .value ==
                                                          9
                                                      ? SizedBox()
                                                      : obj.selectedItemPosition
                                                                  .value ==
                                                              10
                                                          ? HistoryScreen()
                                                          : obj.selectedItemPosition
                                                                      .value ==
                                                                  11
                                                              ? Upgrade_to_pro()
                                                              : obj.selectedItemPosition
                                                                          .value ==
                                                                      12
                                                                  ? Edit_profile()
                                                                  : obj.selectedItemPosition
                                                                              .value ==
                                                                          13
                                                                      ? AffiliateScreen()
                                                                      : obj.selectedItemPosition.value ==
                                                                              14
                                                                          ? InvoiceScreen()
                                                                          : obj.selectedItemPosition.value == 15
                                                                              ? SecurityScreen()
                                                                              : obj.selectedItemPosition.value == 16
                                                                                  ? PrivacyPolicyScreen()
                                                                                  : obj.selectedItemPosition.value == 17
                                                                                      ? FaqScreen()
                                                                                      : const TranslateScreen(),
              obj.dialogueopen.value
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                      child: Container(
                        height: ScreenUtil().screenHeight,
                        color: Colors.transparent,
                        width: ScreenUtil().screenWidth,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        );
      }),
    );
  }
}


    // bottomNavigationBar: ValueListenableBuilder(
    //       valueListenable:obj.bottomsheetIndex,
    //       builder: (context, val, child) {
    //         return Obx(
    //           () => SnakeNavigationBar.color(
    //             behaviour: SnakeBarBehaviour.floating,
    //             snakeShape: SnakeShape.circle,
    //             height: 70.h,
    //             elevation: 10,
    //             shape: const RoundedRectangleBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(0)),
    //             ),
    //             padding: const EdgeInsets.all(0),
    //             snakeViewColor: primaryColor,
    //             selectedItemColor: SnakeShape.circle == SnakeShape.indicator
    //                 ? primaryColor
    //                 : null,
    //             unselectedItemColor: Colors.blueGrey,
    //             currentIndex: HomeController.to.bottomsheetIndex.value,
    //             onTap: (index) {
    //               HomeController.to.selectedItemPosition.value = index;
    //               HomeController.to.bottomsheetIndex.value = index;
    //             },
    //             items: [
    //               BottomNavigationBarItem(
    //                 icon: SvgPicture.asset(
    //                   "images/menue.svg",
    //                   color: HomeController.to.selectedItemPosition.value == 0
    //                       ? whiteColor
    //                       : textgrey,
    //                 ),
    //                 label: 'menue',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: SvgPicture.asset(
    //                   "images/chat.svg",
    //                   color: HomeController.to.selectedItemPosition.value == 1
    //                       ? whiteColor
    //                       : textgrey,
    //                 ),
    //                 label: 'chat',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: SvgPicture.asset(
    //                   "images/history.svg",
    //                   color: HomeController.to.selectedItemPosition.value == 2
    //                       ? whiteColor
    //                       : textgrey,
    //                 ),
    //                 label: 'history',
    //               ),
    //               BottomNavigationBarItem(
    //                 icon: SvgPicture.asset(
    //                   "images/person.svg",
    //                   color: HomeController.to.selectedItemPosition.value == 3
    //                       ? whiteColor
    //                       : textgrey,
    //                 ),
    //                 label: 'person',
    //               ),
    //             ],
    //           ),
    //         );
    //       }),