import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/main.dart';
import 'package:wanandroid/page/home_page.dart';
import 'package:wanandroid/page/my_page.dart';
import 'package:wanandroid/widget/keep_alive_manager.dart';

class MainPageController extends GetxController {
  late PageController pageController;
  var currentPageIndex = 0.obs;

  List<BottomNavigationBarItem> bottomNavigationItems() => [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ];

  List<Widget> navigationPages() => [KeepAliveManager(child: HomePage()), KeepAliveManager(child: MyPage())];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void onPageChanged(int index) {
    if (index != currentPageIndex.value) {
      currentPageIndex.value = index;
    }
  }

  void onTabClick(int index) {
    if (index != currentPageIndex.value) {
      currentPageIndex.value = index;
      pageController.jumpToPage(index);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
