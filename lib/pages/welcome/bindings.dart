import 'package:get/get.dart';

import 'controller.dart';

class WelcomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }

}