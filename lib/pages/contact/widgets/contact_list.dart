import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/values/colors.dart';

import '../../../common/models/user.dart';
import '../controller.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({Key? key}) : super(key: key);

  Widget BuildListItem(UserData item) {

    return Container(
      padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: () {
          if (item.id != null) {
            controller.startChat(item);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, left: 0.w, right: 15.w),
              child: SizedBox(
                width: 54.w,
                height: 54.h,
                child: CachedNetworkImage(
                  imageUrl: "${item.photoUrl}",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.w, left: 0.w, right: 0.w),
              width: 250.w,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Color(0xffe5efe5)
                  ),
                ),
              ),
              child: SizedBox(
                width: 200.w,
                height: 42.w,
                child: Text(
                  "${item.name}" ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.thirdElement,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.w,
              vertical: 0.w
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                var item = controller.state.contactList[index];
                return BuildListItem(item);
              },
              childCount: controller.state.contactList.length,
            ),


          ),
        ),
      ],
    ));
  }
}
