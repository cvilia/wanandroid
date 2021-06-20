import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/web_page_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends BaseStatelessWidget<WebPageController> {
  @override
  getController() {
    return Get.put(WebPageController());
  }

  @override
  Widget pageContent() {
    return Stack(
      children: [
        SafeArea(
          child: WebView(
            initialUrl: Get.arguments,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (link) => controller.showProgress.value = false,
            onProgress: (progress) => controller.setProgress(progress),
          ),
        ),
        Obx(
          () => Visibility(
            child: LinearProgressIndicator(
              value: controller.progress.value,
              color: Colors.blue,
              backgroundColor: Colors.white,
            ),
            visible: controller.showProgress.value,
          ),
        ),
      ],
    );
  }
}
