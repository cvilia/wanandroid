import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/login_page_controller.dart';

class LoginPage extends BaseStatelessWidget<LoginPageController> {
  @override
  getController() {
    return Get.put(LoginPageController());
  }

  @override
  bool hideKeyboard() => true;

  @override
  Widget pageContent() {
    return Stack(
      children: [
        Positioned.fill(child: Container(color: Color(0xff804070))),
        // Positioned.fill(child: BubbleWidget()),
        Positioned.fill(child: _pageContent()),
      ],
    );
  }

  Widget _pageContent() {
    return Obx(() {
      if (controller.pageType.value) {
        return _loginWidget();
      } else {
        return _registerWidget();
      }
    });
  }

  ///登录控件
  Widget _loginWidget() {
    return _contentScaffold(
      [
        Text('欢迎回来', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 30, fontWeight: FontWeight.bold)),
        _editScaffold(labelText: '用户名', controller: controller.loginAccountController, paddingTop: 80),
        _editScaffold(labelText: '密码', controller: controller.loginPasswordController, paddingTop: 50),
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
            onTap: () => controller.login(),
          ),
        ),
        _bottomButtonScaffold(leftText: '注册账号', rightText: '忘记密码'),
      ],
    );
  }

  Widget _registerWidget() {
    return _contentScaffold(
      [
        Text(
          '创建账号',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        _editScaffold(labelText: '请输入用户名', controller: controller.registerAccountController, paddingTop: 50),
        _editScaffold(labelText: '请输入密码', controller: controller.registerPasswordController, paddingTop: 20),
        _editScaffold(labelText: '请再次输入密码', controller: controller.registerPasswordAgainController, paddingTop: 20),
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
        _bottomButtonScaffold(leftText: '注册账号'),
      ],
    );
  }

  Widget _bottomButtonScaffold({required String leftText, String rightText = '1'}) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_inkText(leftText), if (controller.pageType.value) _inkText(rightText)],
      ),
    );
  }

  Widget _inkText(String text) {
    return InkWell(
      onTap: () => controller.switchPageType(),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white.withOpacity(0.8)),
      ),
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

  Widget _contentScaffold(List<Widget> children) {
    return Container(
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
            children: children,
          ),
        )
      ]),
    );
  }
}

class BubbleWidget extends StatefulWidget {
  @override
  _BubbleWidgetState createState() => _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget> with TickerProviderStateMixin {
  List<Bubble> bubbles = [];
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  double maxSpeed = 1.0;
  double maxRadius = 50;
  double maxTheta = 2 * pi;

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 20; i++) {
      Bubble bubble = Bubble();
      bubble.position = Offset(-1, -1);
      bubble.speed = random.nextDouble() * maxSpeed;
      bubble.radius = random.nextDouble() * maxRadius;
      bubble.theta = random.nextDouble() * maxTheta;
      bubble.color = Color(0xfffd8c95).withOpacity(random.nextDouble());
      bubbles.add(bubble);
    }
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
     if(mounted){
       setState(() {});
     }
    });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return buildBubbleWidget(context);
  }

  Widget buildBubbleWidget(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: MyPainter(bubbles: bubbles, random: random),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Bubble> bubbles;
  final Random random;

  Paint _paint = Paint()..isAntiAlias = true;

  MyPainter({required this.bubbles, required this.random});

  @override
  void paint(Canvas canvas, Size size) {
    bubbles.forEach((element) {
      Offset offset = calculatePosition(element.speed, element.theta);
      double x = offset.dx + element.position.dx;
      double y = offset.dy + element.position.dy;

      if (x < 0 || x > size.width) {
        x = random.nextDouble() * size.width;
      }
      if (y < 0 || y > size.height) {
        y = random.nextDouble() * size.height;
      }
      element.position = Offset(x, y);
    });
    bubbles.forEach((element) {
      _paint.color = element.color;
      canvas.drawCircle(element.position, element.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Offset calculatePosition(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }
}

class Bubble {
  late Offset position;
  late Color color;
  late double speed;
  late double theta;
  late double radius;
}
