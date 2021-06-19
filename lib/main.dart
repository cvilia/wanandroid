import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/main_page_controller.dart';
import 'package:wanandroid/widget/custom_scroll_behavior.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends BaseStatelessWidget<MainPageController> {
  @override
  Widget? bottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomNavigationItems(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => controller.onTabClick(index),
        currentIndex: controller.currentPageIndex.value,
      ),
    );
  }

  @override
  getController() {
    return Get.put(MainPageController());
  }

  @override
  Widget pageContent() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: PageView(
        physics: PageScrollPhysics(),
        controller: controller.pageController,
        children: controller.navigationPages(),
        onPageChanged: (index) => controller.onPageChanged(index),
      ),
    );
  }

  @override
  bool showAppBar() {
    return false;
  }
}
