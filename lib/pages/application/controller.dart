import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_chat/pages/application/state.dart';


class AppController extends GetxController {
  final state = AppState();
  AppController();

  late final List<String> tabNames;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> tabs;

  @override
  void onInit() {
    super.onInit();
    tabNames = ["Chat", "Contacts", "My Profile"];
    tabs = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded, color: Colors.grey,),
        activeIcon: Icon(Icons.chat_rounded, color: Colors.deepPurple,),
        label: 'Chat',
        backgroundColor: Colors.lightBlueAccent,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.contact_page_rounded, color: Colors.grey,),
        activeIcon: Icon(Icons.contact_page_rounded, color: Colors.deepPurple,),
        label: 'Contacts',
        backgroundColor: Colors.lightBlueAccent,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded, color: Colors.grey,),
        activeIcon: Icon(Icons.person_rounded, color: Colors.deepPurple,),
        label: 'Profile',
        backgroundColor: Colors.lightBlueAccent,
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  handlePageChange(int index) {
    state.page = index;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}