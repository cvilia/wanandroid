import 'package:flutter/material.dart';

///最开始的时候设置的controller和context都是final的，所以不能重复赋值，所以会报已经初始化过的错误
abstract class BaseStatelessWidget<T> extends StatelessWidget {
  late T controller;
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    controller = getController();
    this.context = context;
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        resizeToAvoidBottomInset: !hideKeyboard(),
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
