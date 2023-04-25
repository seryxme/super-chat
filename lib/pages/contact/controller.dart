import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:super_chat/common/store/user.dart';
import 'package:super_chat/pages/contact/state.dart';

import '../../common/models/message.dart';
import '../../common/models/user.dart';


class ContactController extends GetxController {
  final state = ContactState();
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  startChat(UserData toUser) async {
    var sentMessages = await db.collection("messages")
        .withConverter(
        fromFirestore: Message.fromFirestore,
        toFirestore: (Message msg, options) => msg.toFirestore()
    )
        .where("from_uid", isEqualTo: token)
        .where("to_uid", isEqualTo: toUser.id)
        .get();

    var receivedMessages = await db.collection("messages")
        .withConverter(
        fromFirestore: Message.fromFirestore,
        toFirestore: (Message msg, options) => msg.toFirestore()
    )
        .where("from_uid", isEqualTo: toUser.id)
        .where("to_uid", isEqualTo: token)
        .get();

    if (sentMessages.docs.isEmpty && receivedMessages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponseData currentUser = UserLoginResponseData
          .fromJson(jsonDecode(profile));
      var messageData = Message(
        from_uid: currentUser.accessToken,
        to_uid: toUser.id,
        from_name: currentUser.displayName,
        to_name: toUser.name,
        from_avatar: currentUser.photoUrl,
        to_avatar: toUser.photoUrl,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num: 0,
      );
      db.collection("messages")
          .withConverter(
          fromFirestore: Message.fromFirestore,
          toFirestore: (Message msg, options) => msg.toFirestore()
      ).add(messageData).then((value) {
        Get.toNamed("/chat", parameters: {
          "doc_id": value.id,
          "to_uid": toUser.id ?? "",
          "to_name": toUser.name ?? "",
          "to_avatar": toUser.photoUrl ?? "",
        });
      });
    } else {
      if (receivedMessages.docs.isNotEmpty) {
        Get.toNamed("/chat", parameters: {
          "doc_id": receivedMessages.docs.first.id,
          "to_uid": toUser.id ?? "",
          "to_name": toUser.name ?? "",
          "to_avatar": toUser.photoUrl ?? "",
        });
        if (sentMessages.docs.isNotEmpty) {
          Get.toNamed("/chat", parameters: {
            "doc_id": sentMessages.docs.first.id,
            "to_uid": toUser.id ?? "",
            "to_name": toUser.name ?? "",
            "to_avatar": toUser.photoUrl ?? "",
          });
        }
      }
    }
  }

  asyncLoadAllData() async {
    var allUsers = await db.collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
        fromFirestore: UserData.fromFirestore,
        toFirestore: (UserData userData, options) => userData.toFirestore()
    ).get();

    for (var doc in allUsers.docs) {
      state.contactList.add(doc.data());
    }
  }

}