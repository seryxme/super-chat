import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/store/user.dart';
import 'state.dart';

import '../../common/models/message.dart';
import '../../common/models/user.dart';


class ChatController extends GetxController {
  final state = ChatState();
  ChatController();
  var doc_id;
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data["doc_id"];
    state.to_uid.value = data["to_uid"] ?? "";
    state.to_name.value = data["to_name"] ?? "";
    state.to_avatar.value = data["to_avatar"] ?? "";
  }

}