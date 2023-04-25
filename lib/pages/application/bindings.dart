import 'package:get/get.dart';

import '../contact/controller.dart';
import 'controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<ContactController>(() => ContactController());
  }

}