import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_controller.dart';

class LoginPageController extends BaseController {
  var pageType = true.obs;
  late final TextEditingController loginAccountController;
  late final TextEditingController loginPasswordController;

  late final TextEditingController registerAccountController;
  late final TextEditingController registerPasswordController;
  late final TextEditingController registerPasswordAgainController;
  late final TextEditingController registerVerifyCodeController;

  @override
  void init() {
    loginAccountController = TextEditingController();
    loginPasswordController = TextEditingController();

    registerAccountController = TextEditingController();
    registerPasswordController = TextEditingController();
    registerPasswordAgainController = TextEditingController();
    registerVerifyCodeController = TextEditingController();
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

    registerAccountController.dispose();
    registerPasswordController.dispose();
    registerPasswordAgainController.dispose();
    registerVerifyCodeController.dispose();
  }
}
