import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/models/msgcontent.dart';

Widget ReceivedChatItem(MessageContent item) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230.w,
            minHeight: 40.w,
          ),
          child: Container(
              margin: EdgeInsets.only(top: 0.w, right: 10.w),
              padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 176, 231, 106),
                    Color.fromARGB(255, 156, 231, 116),
                    Color.fromARGB(255, 136, 231, 126),
                    Color.fromARGB(255, 116, 231, 136),
                  ],
                    transform: GradientRotation(90),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.w))
              ),
              child: item.type == "text" ? Text("${item.content}") :
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 230.w,
                  minHeight: 40.w,
                ),
                child: GestureDetector(
                  onTap: (){},
                  child: CachedNetworkImage(
                    imageUrl: "${item.content}",
                  ),
                ),
              )
          ),
        ),
      ],
    ),
  );
}