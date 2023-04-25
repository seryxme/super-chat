import 'package:cloud_firestore/cloud_firestore.dart';

class MessageContent {
  final String? uid;
  final String? content;
  final String? type;
  final Timestamp? postTime;

  MessageContent({
    this.uid,
    this.content,
    this.type,
    this.postTime,
  });

  factory MessageContent.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return MessageContent(
      uid: data?['uid'],
      content: data?['content'],
      type: data?['type'],
      postTime: data?['addtime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (content != null) "content": content,
      if (type != null) "type": type,
      if (postTime != null) "addtime": postTime,
    };
  }
}