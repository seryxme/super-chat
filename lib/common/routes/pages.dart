import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/welcome/index.dart';
import '../../pages/login/index.dart';
import '../../pages/application/index.dart';
import '../../pages/contact/index.dart';
import '../../pages/message/chat/index.dart';
import '../middlewares/router_welcome.dart';
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
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.APP,
      page: () => const AppPage(),
      binding: AppBindings(),
      middlewares: [
        // RouteAuthMiddleware(),
      ]
    ),
    GetPage(
        name: AppRoutes.CONTACT,
        page: () => const ContactPage(),
        binding: ContactBindings(),
    ),
    GetPage(
      name: AppRoutes.CHAT,
      page: () => const ChatPage(),
      binding: ChatBindings(),
    ),
  ];
}