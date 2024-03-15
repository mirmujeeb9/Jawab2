// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upgrade_to_pro_Controller extends GetxController {
  static Upgrade_to_pro_Controller get to => Get.find();

  PageController controller = PageController(initialPage: 0);
  Rx<int> index = 0.obs;

  List<SubscriptionModel> subscriptionList = [
    SubscriptionModel(
        afterprice: "Free Forever",
        price: "0",
        rules: [
          "Only available when demand is low",
          "Slow response speed",
          "New feature update are slower",
          "30 day history",
          "Up to 1000 message/me",
        ],
        subtitle: "Basic chat functionality",
        title: "Free"),
    SubscriptionModel(
        afterprice: "Go Premium",
        price: "10",
        rules: [
          "Always available in any demand",
          "Fast response speed",
          "Priority access to new features ",
          "Advanced",
          "Dedicated support",
        ],
        subtitle: "Manually chat functionality",
        title: "Pro"),
  ];
}

class SubscriptionModel {
  String? title;
  String? subtitle;
  String? price;
  String? afterprice;
  List<String>? rules;
  SubscriptionModel({
    this.title,
    this.subtitle,
    this.price,
    this.afterprice,
    this.rules,
  });
}
