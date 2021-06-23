import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/register_page_controller.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseStatelessWidget<RegisterPageController> {
  @override
  RegisterPageController getController() {
    return Get.put(RegisterPageController());
  }

  @override
  Widget pageContent() {
    return _pageContent();
  }

  Widget _pageContent() {
    return Container(
      color: Color(0xff804070),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '创建账号',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              _editScaffold(labelText: '请输入用户名', controller: controller.registerAccountController, paddingTop: 50),
              _editScaffold(labelText: '请输入密码', controller: controller.registerPasswordController, paddingTop: 20),
              _editScaffold(
                  labelText: '请再次输入密码', controller: controller.registerPasswordAgainController, paddingTop: 20),
              _editScaffold(labelText: '请输入验证码', controller: controller.registerVerifyCodeController, paddingTop: 20),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 30),
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Color(0xfffd8c95),
                    radius: 30,
                    child: Icon(Icons.arrow_forward, size: 40, color: Colors.white),
                  ),
                  onTap: () => controller.register(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => controller.switchLogin(),
                      child: Text(
                        '立即登录',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _editScaffold(
      {required String labelText,
      required TextEditingController controller,
      required double paddingTop,
      bool obscureText = false}) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextField(
        controller: controller,
        showCursor: false,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
        decoration: InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.8), width: 0.5)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.8), width: 0.5)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.8), width: 0.5)),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14)),
      ),
    );
  }
}
