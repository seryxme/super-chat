import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/values/colors.dart';
import 'package:super_chat/pages/message/chat/controller.dart';
import 'package:super_chat/pages/message/chat/widgets/received_chat.dart';
import 'package:super_chat/pages/message/chat/widgets/sent_chat.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      color: AppColors.chatbg,
      padding: EdgeInsets.only(bottom: 50.h),
      child: CustomScrollView(
        reverse: true,
        controller: controller.scroller,
        slivers: [
          SliverPadding(padding: EdgeInsets.symmetric(
              vertical: 0.w,
              horizontal: 0.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  var item = controller.state.msgContentList[index];
                  if(controller.user_id == item.uid) {
                    return SentChatItem(item);
                  }
                  return ReceivedChatItem(item);
                },
                childCount: controller.state.msgContentList.length,
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
