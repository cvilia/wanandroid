import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_helper.dart';
import 'package:wanandroid/model/home_banner_model.dart';

class SwiperController extends GetxController with SingleGetTickerProviderMixin {
  var animaValue = 0.obs;
  late AnimationController animatedController;
  late Animation<int> animation;
  var banners = Rxn<List<MyBanner>>();
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    requestBanner();
  }

  Future<void> requestBanner() async {
    await dioHelper.get(
      Api.HOME_BANNER,
      callBack: (response) {
        var json = jsonDecode(response.data);
        if (json['errorCode'] == 0) {
          banners.value = HomeBannerModel.fromJson(json).banners!;
          initAnimate();
        }
      },
    );
  }

  void initAnimate() {
    if (banners.value != null) {
      animatedController = AnimationController(vsync: this, duration: Duration(seconds: 3 * banners.value!.length));
      animation = IntTween(begin: 0, end: banners.value!.length - 1).animate(animatedController);
      animation.addListener(() {
        animaValue.value = animation.value;
        if (pageController.hasClients) {
          pageController.jumpToPage(animaValue.value);
        }
      });
      animatedController.repeat();
    }
  }
}
