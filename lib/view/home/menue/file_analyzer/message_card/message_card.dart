import 'package:alxza/view/home/menue/file_analyzer/model/model.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    bool isMe = widget.message.fromId == 'user';
    return isMe ? _blueMessage() : _greenMessage();
  }

  Widget _blueMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(width * .03),
            child: Card(
              elevation: 10,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11.r),
                    topRight: Radius.circular(11.r),
                    bottomRight: Radius.circular(11.r)),
              ),
              child: Container(
                width: 230.w,
                margin: EdgeInsets.symmetric(
                    horizontal: width * .04, vertical: height * .01),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11.r),
                      topRight: Radius.circular(11.r),
                      bottomRight: Radius.circular(11.r)),
                ),
                child: TextWidget(
                  text: widget.message.msg!,
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _greenMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.message.msg!));
                },
                child: SvgPicture.asset(
                  "images/copy.svg",
                  height: 15.h,
                  width: 15.w,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  Share.share(
                    widget.message.msg!,
                  );
                },
                child: SvgPicture.asset(
                  "images/share.svg",
                  height: 15.h,
                  width: 15.w,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(width * .03),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(11.r),
                    topRight: Radius.circular(11.r),
                    bottomRight: Radius.circular(11.r)),
              ),
              child: Container(
                width: 230.w,
                margin: EdgeInsets.symmetric(
                    horizontal: width * .04, vertical: height * .01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11.r),
                      topRight: Radius.circular(11.r),
                      bottomLeft: Radius.circular(11.r)),
                ),
                child: TextWidget(
                  text: widget.message.msg!,
                  fontSize: 13.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
