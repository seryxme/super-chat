import 'package:get/get.dart';

import '../../common/models/msgcontent.dart';

class ChatState {
  RxList<MessageContent> msgContentList = <MessageContent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "unknown location".obs;
}