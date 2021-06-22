import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/my_page_controller.dart';
import 'package:wanandroid/widget/custom_scroll_behavior.dart';

import 'login/login_page.dart';

class MyPage extends BaseStatelessWidget<MyPageController> {
  @override
  Widget pageContent() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: 600,
          child: InkWell(
            onTap: () => Get.to(() => LoginPage()),
            child: Text('立即登录',style: Theme.of(context).textTheme.bodyText1,),
          ),
        ),
      ),
    );
  }

  @override
  getController() {
    return Get.put(MyPageController());
  }
}
