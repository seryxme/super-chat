import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmToken;
  final Timestamp? addTime;

  UserData({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.location,
    this.fcmToken,
    this.addTime,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options
      )
  {
    final data = snapshot.data();
    return UserData(
        id: data?["id"],
        name: data?["name"],
        email: data?["email"],
        photoUrl: data?["photoUrl"],
        location: data?["location"],
        fcmToken: data?["fcmtoken"],
        addTime: data?["addtime"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id" : id,
      if (name != null) "name" : name,
      if (email != null) "email" : email,
      if (photoUrl != null) "photoUrl" : photoUrl,
      if (location != null) "location" : location,
      if (fcmToken != null) "fcmtoken" : fcmToken,
      if (addTime != null) "addtime" : addTime,
    };
  }
}

class UserLoginResponseData {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;

  UserLoginResponseData({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  factory UserLoginResponseData.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseData(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        email: json["email"],
        photoUrl: json["photoUrl"]
      );

  Map<String, dynamic> toJson() => {
    "access_token" : accessToken,
    "display_name" : displayName,
    "email" : email,
    "photoUrl" : photoUrl
  };
}

class MeListIem {
  String? name;
  String? icon;
  String? explain;
  String? route;

  MeListIem({
    this.name,
    this.icon,
    this.explain,
    this.route,
  });

  factory MeListIem.fromJson(Map<String, dynamic> json) =>
      MeListIem(
          name: json["name"],
          icon: json["icon"],
          explain: json["explain"],
          route: json["route"]
      );
}