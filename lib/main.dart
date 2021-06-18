import 'package:flutter/material.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/main_page_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends BaseStatelessWidget<MainPageController> {

  @override
  BottomNavigationBar? bottomNavigationBar() {
    return BottomNavigationBar(items:controller.bottomNavigationItems());
  }

  @override
  getController() {
    return MainPageController();
  }

  @override
  Widget pageContent() {
    return Container();
  }
}
