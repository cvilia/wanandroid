import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_controller.dart';
import 'package:wanandroid/page/login/login_page.dart';

class RegisterPageController extends BaseController {
  late final TextEditingController registerAccountController;
  late final TextEditingController registerPasswordController;
  late final TextEditingController registerPasswordAgainController;
  late final TextEditingController registerVerifyCodeController;

  @override
  void init() {
    registerAccountController = TextEditingController();
    registerPasswordController = TextEditingController();
    registerPasswordAgainController = TextEditingController();
    registerVerifyCodeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    registerAccountController.dispose();
    registerPasswordController.dispose();
    registerPasswordAgainController.dispose();
    registerVerifyCodeController.dispose();
  }

  Future<void> register() async {}

  void switchLogin() => Get.to(() => LoginPage());
}
