import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_controller.dart';
import 'package:wanandroid/page/login/register_page.dart';

class LoginPageController extends BaseController {
  var pageType = true.obs;
  late final TextEditingController loginAccountController;
  late final TextEditingController loginPasswordController;

  @override
  void init() {
    loginAccountController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  ///登录
  Future<void> login() async {}

  Future<void> register() async {}

  void switchPageType() {
    if (pageType.value) {
      pageType.value = false;
    } else {
      ///切换为注册
      pageType.value = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginAccountController.dispose();
    loginPasswordController.dispose();
  }

  void forgetPassword() {}

  void switchRegister() => Get.to(() => RegisterPage());
}
