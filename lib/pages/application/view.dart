import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../contact/view.dart';
import 'controller.dart';

class AppPage extends GetView<AppController>  {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChange,
        children: [
          Center(child: Text("Chat Page")),
          Center(child: ContactPage()),
          Center(child: Text("Profile Page")),
        ],
      );
    }

    Widget _buildBottomNavBar() {
      return Obx(
              () => BottomNavigationBar(
                items: controller.tabs,
                currentIndex: controller.state.page,
                type: BottomNavigationBarType.fixed,
                onTap: controller.handleNavBarTap,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepPurple,
              )
      );
    }

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
