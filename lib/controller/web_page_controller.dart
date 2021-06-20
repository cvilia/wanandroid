import 'dart:io';

import 'package:get/get.dart';
import 'package:wanandroid/bridge/log.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageController extends GetxController {
  final String tag = 'WebPageController';
  var progress = 0.0.obs;
  var showProgress = true.obs;

  void setProgress(int progress) {
    this.progress.value = progress / 100;
    Log.d(tag, '当前进度${this.progress.value}');
  }

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
