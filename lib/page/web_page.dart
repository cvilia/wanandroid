import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  @override
  AppBar? appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.bottomSheet(bottomSheet()),
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _shareOptions(shareType: 0),
          _shareOptions(shareType: 1),
          _shareOptions(shareType: 2),
          _shareOptions(shareType: 3),
        ],
      ),
    );
  }

  Widget _shareOptions({required int shareType}) {
    String assetsImage = 'assets/share/share_wechat.png';
    String title = '微信';
    double width = 35;
    if (shareType == 0) {
      assetsImage = 'assets/share/share_wechat.png';
      title = '微信';
    } else if (shareType == 1) {
      assetsImage = 'assets/share/share_wechat_circle.png';
      title = '朋友圈';
    } else if (shareType == 2) {
      assetsImage = 'assets/share/share_wechat_favor.png';
      title = '收藏';
    } else {
      assetsImage = 'assets/share/share_copy_link.png';
      title = '复制链接';
      width = 30;
    }
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () => controller.onShare(shareType),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                assetsImage,
                width: width,
                fit: BoxFit.fitWidth,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
