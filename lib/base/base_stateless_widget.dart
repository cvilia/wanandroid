import 'package:flutter/material.dart';

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
        bottomNavigationBar: bottomNavigationBar(),
        appBar: appBar(),
        body: GestureDetector(
          onTap: () => hideKeyboard() ? FocusScope.of(context).requestFocus(FocusNode()) : null,
          child: pageContent(),
          behavior: HitTestBehavior.translucent,
        ),
      ),
    );
  }

  ///页面内容
  Widget pageContent();

  ///系统返回键监听
  Future<bool> onBackPress() async {
    return true;
  }

  bool hideKeyboard() => false;

  AppBar? appBar() => null;

  T getController();

  Widget? bottomNavigationBar() => null;
}
