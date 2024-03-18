import 'package:alxza/view/home/conjugaison%201/conjugaison1.dart';
import 'package:alxza/view/home/folder/folder.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/advanced_dictionary/advanced_dictionary.dart';
import 'package:alxza/view/home/menue/image_transcription/image_transcription.dart';
import 'package:alxza/view/home/menue/menue.dart';
import 'package:alxza/view/home/menue/translator/translator.dart';
import 'package:alxza/view/home/menue/video_transcription/video_transcription.dart';
import 'package:alxza/view/home/profile.dart/profile.dart';
import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: HomeController.to.bottomsheetIndex,
          builder: (context, val, child) {
            return Obx(
              () => SnakeNavigationBar.color(
                behaviour: SnakeBarBehaviour.floating,
                snakeShape: SnakeShape.circle,
                height: 70.h,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                padding: const EdgeInsets.all(0),
                snakeViewColor: primaryColor,
                selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                    ? primaryColor
                    : null,
                unselectedItemColor: Colors.blueGrey,
                currentIndex: HomeController.to.bottomsheetIndex.value,
                onTap: (index) {
                  HomeController.to.selectedItemPosition.value = index;
                  HomeController.to.bottomsheetIndex.value = index;
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "images/menue.svg",
                      color: HomeController.to.selectedItemPosition.value == 0
                          ? whiteColor
                          : textgrey,
                    ),
                    label: 'menue',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "images/chat.svg",
                      color: HomeController.to.selectedItemPosition.value == 1
                          ? whiteColor
                          : textgrey,
                    ),
                    label: 'chat',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "images/history.svg",
                      color: HomeController.to.selectedItemPosition.value == 2
                          ? whiteColor
                          : textgrey,
                    ),
                    label: 'history',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "images/person.svg",
                      color: HomeController.to.selectedItemPosition.value == 3
                          ? whiteColor
                          : textgrey,
                    ),
                    label: 'person',
                  ),
                ],
              ),
            );
          }),
      body: Obx(
        () => HomeController.to.selectedItemPosition.value == 0
            ? const MenueScreen()
            : HomeController.to.tabIndex.value == 0 &&
                    HomeController.to.selectedItemPosition.value == 1
                ? const TranslateScreen()
                : HomeController.to.tabIndex.value == 1 &&
                        HomeController.to.selectedItemPosition.value == 1
                    ? const AdvanceDisctionaryScreen()
                    : HomeController.to.tabIndex.value == 2 &&
                            HomeController.to.selectedItemPosition.value == 1
                        ? const VideoTranscriptionScreen()
                        : HomeController.to.tabIndex.value == 3 &&
                                HomeController.to.selectedItemPosition.value ==
                                    1
                            ? const ImageTranscriptionScreen()
                            : HomeController.to.tabIndex.value == 4 &&
                                    HomeController
                                            .to.selectedItemPosition.value ==
                                        1
                                ? const Conjugaison_1()
                                : HomeController
                                            .to.selectedItemPosition.value ==
                                        2
                                    ? const FolderScreen()
                                    : HomeController.to.selectedItemPosition
                                                .value ==
                                            3
                                        ? const ProfileScreen()
                                        : const TranslateScreen(),
      ),
    );
  }
}
