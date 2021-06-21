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
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          hintColor: Color(0xffb0b0b0),
          splashColor: Colors.transparent,
          primaryColor: Colors.teal,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(color: Color(0xff1a1a1a), fontSize: 15),
            subtitle1: TextStyle(color: Color(0xff1a1a1a), fontSize: 12),
            bodyText1: TextStyle(color: Color(0xff1a1a1a), fontSize: 15),
            bodyText2: TextStyle(color: Color(0xff1a1a1a), fontSize: 10),
          ),
          iconTheme: IconThemeData(color: Colors.white)),
      debugShowCheckedModeBanner: false,
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
}
