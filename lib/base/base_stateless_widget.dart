import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseStatelessWidget<T> extends StatelessWidget {
  late final T controller;

  @override
  Widget build(BuildContext context) {
    controller = getController();
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        appBar: showAppBar() ? _appBar() : null,
        body: pageContent(),
      ),
    );
  }

  ///页面内容
  Widget pageContent();

  ///系统返回键监听
  Future<bool> onBackPress() async {
    return true;
  }

  PreferredSizeWidget? _appBar();

  bool showAppBar() => true;

  T getController();

  BottomNavigationBar? bottomNavigationBar() {
    return null;
  }
}
