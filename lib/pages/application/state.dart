import 'package:get/get.dart';

class AppState {
  final _page = 0.obs;
  int get page => _page.value;
  set page(index) => _page.value = index;
}