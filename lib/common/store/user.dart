import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/user.dart';
import '../services/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = "";
  final _profile = UserLoginResponseData().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponseData get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString("STORAGE_USER_TOKEN_KEY");
    var profileOffline = StorageService.to.getString("STORAGE_USER_PROFILE_KEY");
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserLoginResponseData.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    return StorageService.to.getString("STORAGE_USER_PROFILE_KEY");
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString("STORAGE_USER_TOKEN_KEY", value);
    token = value;
  }

  Future<void> saveProfile(UserLoginResponseData profile) async {
    _isLogin.value = true;
    StorageService.to.setString("STORAGE_USER_PROFILE_KEY", jsonEncode(profile));
    setToken(profile.accessToken!);
  }

  Future<void> onLogout() async {
    StorageService.to.remove("STORAGE_USER_TOKEN_KEY");
    StorageService.to.remove("STORAGE_USER_PROFILE_KEY");
    _isLogin.value = true;

  }
}