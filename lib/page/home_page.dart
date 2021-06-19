import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/home_page_controller.dart';
import 'package:wanandroid/widget/swiper.dart';

class HomePage extends BaseStatelessWidget<HomePageController> {
  @override
  getController() {
    return Get.put(HomePageController());
  }

  @override
  Widget pageContent() {
    return SafeArea(child: Obx(() {
      if (controller.banners.value == null) {
        return Container();
      } else {
        return SizedBox(
          height: 150,
          child: Swiper(),
        );
      }
    }));
  }
}
