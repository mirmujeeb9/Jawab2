import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:alxza/widget/text_widget.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<dynamic> documents = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDocuments();
  }

  Future<void> fetchDocuments() async {
    try {
      final response = await http.get(
        Uri.parse('${StaticData.mainURL}document'),
        headers: {
          'Authorization': 'Bearer ${StaticData.token}', // Add token here
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          documents = json.decode(response.body);
          isLoading = false;
        });
      } else {
        print('Failed to load documents');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  void removeDocument(int index) async {
    final document = documents[index];
    try {
      final response = await http.delete(
        Uri.parse('${StaticData.mainURL}document/${document['id']}'),
        headers: {
          'Authorization': 'Bearer ${StaticData.token}',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          documents.removeAt(index);
          showCustomSnackBar("Document Deleted");
        });
      } else {
        showCustomSnackBar("Failed to delete document");
      }
    } catch (e) {
      print('Error: $e');
      showCustomSnackBar("Error: Could not delete document");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : documents.isEmpty
              ? Center(
                  child: TextWidget(
                  text: "No documents available",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ))
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Dismissible(
                        key: ValueKey(document['id']),
                        background: _stackBehindDismiss(),
                        secondaryBackground: _secondarystackBehindDismiss(),
                        onDismissed: (direction) {
                          removeDocument(index);
                        },
                        child: Container(
                          height: 70.h,
                          width: 335.w,
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
                          child: ListTile(
                            leading:
                                SvgPicture.asset("images/document_icon.svg"),
                            title: TextWidget(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              text: document['title'] ?? 'Untitled',
                            ),
                            subtitle: TextWidget(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: Colors.grey,
                              text: document['date_created'] ?? 'Unknown date',
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
                    );
                  },
                ),
    );
  }

  Widget _secondarystackBehindDismiss() {
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

  Widget _stackBehindDismiss() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: primaryColor,
      ),
    );
  }
}
