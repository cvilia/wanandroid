import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/my_page_controller.dart';

class MyPage extends BaseStatelessWidget<MyPageController> {
  @override
  Widget pageContent() {
    return Container();
  }

  @override
  bool showAppBar() {
    // TODO: implement showAppBar
    return super.showAppBar();
  }

  @override
  getController() {
    return Get.put(MyPageController());
  }
}
