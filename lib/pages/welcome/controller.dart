import 'package:get/get.dart';
import 'package:super_chat/pages/welcome/state.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();

  changePage(int index) async {
    state.index.value = index;
  }
}