import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:alxza/widget/text_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<dynamic> historyList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      final response =
          await http.get(Uri.parse('${StaticData.mainURL}document'));
      if (response.statusCode == 200) {
        setState(() {
          historyList = json.decode(response.body);
          isLoading = false;
        });
      } else {
        print('Failed to load history');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  String formatDateTime(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd HH:mm').format(parsedDate);
  }

  void removeItem(int index) {
    setState(() {
      historyList.removeAt(index);
      showCustomSnackBar("Item Deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomAppBar(
                      leadingOnTap: () {
                        // Update home screen position or other action
                      },
                      text: "History",
                      leading: true,
                      action: CustomContainer(
                        onTap: () {},
                        width: 35.w,
                        height: 35.w,
                        margin: EdgeInsets.only(bottom: 5.h),
                        borderRadius: 8.r,
                        borderColor: Colors.grey,
                        borderWidth: 1.w,
                        child: Center(
                          child: SvgPicture.asset("images/Delete.svg"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      itemCount: historyList.length,
                      itemBuilder: (context, index) {
                        final item = historyList[index];
                        final formattedDate =
                            formatDateTime(item['created_at']);
                        final type = item['type'] ?? 'Unknown';

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Container(
                            height: 70.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.r),
                              color: primaryColor,
                            ),
                            child: Dismissible(
                              key: ValueKey(item['title']),
                              background: stackBehindDismiss(),
                              secondaryBackground:
                                  secondarystackBehindDismiss(),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  removeItem(index);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                height: 70.h,
                                width: 335.w,
                                child: ListTile(
                                  title: TextWidget(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    overflow: TextOverflow.ellipsis,
                                    text: item['title'] ?? 'Untitled',
                                  ),
                                  subtitle: TextWidget(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Colors.grey,
                                    text: '$formattedDate - $type',
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.grey,
                                    size: 15.h,
                                  ),
                                  onTap: () {
                                    // Add your onTap functionality here
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget secondarystackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            "images/Delete.svg",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: primaryColor,
      ),
    );
  }
}
