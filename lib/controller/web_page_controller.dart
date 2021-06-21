import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_controller.dart';
import 'package:wanandroid/bridge/log.dart';
import 'package:wanandroid/bridge/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageController extends BaseController {
  final String tag = 'WebPageController';
  var progress = 0.0.obs;
  var showProgress = true.obs;
  late final link;

  void setProgress(int progress) {
    this.progress.value = progress / 100;
    Log.d(tag, '当前进度${this.progress.value}');
  }


  onShare(int shareType) {
    Get.back();
    if (shareType == 0) {
      Toast.showShort('分享到微信联系人');
    } else if (shareType == 1) {
      Toast.showShort('分享到微信朋友圈');
    } else if (shareType == 2) {
      Toast.showShort('添加到微信收藏');
    } else {
      Toast.showShort(link);
      Clipboard.setData(ClipboardData(text: link));
    }
  }

  @override
  void init() {
    link = Get.arguments;
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
