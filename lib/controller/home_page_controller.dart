import 'dart:convert';

import 'package:get/get.dart';
import 'package:wanandroid/bridge/log.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_helper.dart';
import 'package:wanandroid/model/home_banner_model.dart';

class HomePageController extends GetxController {
  var banners = Rxn<List<MyBanner>>();

  @override
  void onInit() {
    super.onInit();
    requestData();
  }

  void requestData() {
    requestBanner();
  }

  Future<void> requestBanner() async {
    await dioHelper.get(Api.HOME_BANNER, callBack: (response) {
      var json = jsonDecode(response.data);
      Log.d('HomePageController', json.toString());
      if (json['errorCode'] == 0) {
        Log.d('HomePageController', '拿到结果');
        banners.value = HomeBannerModel.fromJson(json).banners!;
        banners.value!.forEach((element)=>print(element.title));
      }
    });
  }
}
