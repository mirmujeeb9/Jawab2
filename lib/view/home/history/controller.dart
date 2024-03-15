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
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/camera.svg",
        title: "The availability of free trials or trial...",
        date: "May 17,2023   -   09:30am"),
    HistoryModel(
        icon: "images/youtube.svg",
        title: "The availability of free trials or trial...",
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
