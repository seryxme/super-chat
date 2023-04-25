import 'package:get/get.dart';

import 'controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }

}