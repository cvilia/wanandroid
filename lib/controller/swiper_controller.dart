import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/controller/home_page_controller.dart';
import 'package:wanandroid/model/home_banner_model.dart';

class SwiperController extends GetxController with SingleGetTickerProviderMixin {
  var animaValue = 0.obs;
  late AnimationController animatedController;
  late Animation<int> animation;
  // late HomePageController homeController;
  var banners = Rxn<List<MyBanner>>();
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    banners.value = Get.find<HomePageController>().banners.value;
    animatedController =
        AnimationController(vsync: this, duration: Duration(seconds: 3 * banners.value!.length));
    animation = IntTween(begin: 0, end: banners.value!.length - 1).animate(animatedController);
    animation.addListener(() {
      animaValue.value = animation.value;
      pageController.jumpToPage(animaValue.value);
    });
    animatedController.repeat();
  }
}
