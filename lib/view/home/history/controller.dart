import 'package:get/get.dart';

class HistoryController extends GetxController {
  static HistoryController get to => Get.find();
  List<HistoryModel> historylist = [
    HistoryModel(
        icon: "images/camera.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "Specific service or product you are...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "For software applications, online ser...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "Subscription-based platforms, it is...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "These trials allow you to test the...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "Free trials can range from a few day...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "To determine if a free trial is available...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "Keep in mind that not all products or...",
        date: "May 17,2023   -   09:30am"),
  ];
}

class HistoryModel {
  String? title;
  String? date;
  String? icon;
  HistoryModel({
    required this.title,
    required this.date,
    required this.icon,
  });
}
