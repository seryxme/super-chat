import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:super_chat/common/routes/names.dart';
import 'package:super_chat/pages/login/state.dart';

import '../../common/models/user.dart';
import '../../common/store/user.dart';
import '../../common/widgets/toast.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'openid'
  ]
);

class LoginController extends GetxController {
  final state = LoginState();
  LoginController();
  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      print(user);
      if (user != null) {
        final auth = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";

        UserLoginResponseData userData = UserLoginResponseData();
        userData.accessToken = id;
        userData.displayName = displayName;
        userData.email = email;
        userData.photoUrl = photoUrl;

        print(userData);

        UserStore.to.saveProfile(userData);
        var userBase = await db.collection("users").withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore(),
        ).where("id", isEqualTo: id).get();

        if(userBase.docs.isEmpty) {
          final data = UserData(
            id: id,
            name: displayName,
            email: email,
            photoUrl: photoUrl,
            location: "",
            fcmToken: "",
            addTime: Timestamp.now(),
          );
          await db.collection("users").withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore(),
          ).add(data);
        }
        toastInfo(message: 'Logged in successfully!');
        Get.offAndToNamed(AppRoutes.APP);
      }
    } catch(e) {
      toastInfo(message: "Error: Unable to log you in");
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User not logged in");
      } else {
        print("User logged in");
      }
    });
  }
}