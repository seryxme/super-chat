import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/welcome/index.dart';
import '../../pages/login/index.dart';
import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APP = AppRoutes.APP;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static List<GetPage> routes =[
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
      binding: WelcomeBindings(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}