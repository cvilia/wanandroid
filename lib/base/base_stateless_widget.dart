import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseStatelessWidget<T> extends StatelessWidget {
  late final T controller;
  late final BuildContext context;

  @override
  Widget build(BuildContext context) {
    controller = getController();
    this.context = context;
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        backgroundColor: Colors.white,
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

  bool showAppBar() => false;

  T getController();

  Widget? bottomNavigationBar() {
    return null;
  }
}
