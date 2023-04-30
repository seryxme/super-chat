import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/store/user.dart';
import '../../../common/models/msgcontent.dart';
import 'state.dart';


class ChatController extends GetxController {
  final state = ChatState();
  ChatController();
  var doc_id;
  final db = FirebaseFirestore.instance;
  final user_id = UserStore.to.token;
  final textController = TextEditingController();
  ScrollController scroller = ScrollController();
  FocusNode contentNode = FocusNode();
  var listener;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data["doc_id"];
    state.to_uid.value = data["to_uid"] ?? "";
    state.to_name.value = data["to_name"] ?? "";
    state.to_avatar.value = data["to_avatar"] ?? "";
    print(doc_id);
  }

  sendMessage() async {
    String sentContent = textController.text;

    final content = MessageContent(
      uid: user_id,
      content: sentContent,
      type: "text",
      postTime: Timestamp.now(),
    );

    await db.collection("messages").doc(doc_id).collection("message_list")
        .withConverter(
        fromFirestore: MessageContent.fromFirestore,
        toFirestore: (MessageContent newContent, option) => newContent.toFirestore()
    ).add(content).then((value) {
      print("Snapshot Document ID - ${value.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await db.collection("messages").doc(doc_id).update({
      "last_msg" : sentContent,
      "last_time" : Timestamp.now(),
    });
  }

  @override
  void onReady() async {
    super.onReady();
    var messages = db.collection("messages").doc(doc_id).collection("message_list")
        .withConverter(
        fromFirestore: MessageContent.fromFirestore,
        toFirestore: (MessageContent content, options) => content.toFirestore()
    ).orderBy("addtime", descending: false);
    state.msgContentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch(change.type) {
          case DocumentChangeType.added:
            if (change.doc.data()!= null) {
              state.msgContentList.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
          break;
        }
      }
    },
    onError: (error) => print("Listen failed: $error"),
    );
  }

  @override
  void dispose() {
    scroller.dispose();
    listener.cancel();
    super.dispose();
  }
}