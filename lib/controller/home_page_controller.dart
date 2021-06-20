import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/bridge/log.dart';
import 'package:wanandroid/bridge/toast.dart';
import 'package:wanandroid/controller/web_page_controller.dart';
import 'package:wanandroid/http/dio_helper.dart';
import 'package:wanandroid/model/home_article_model.dart';
import 'package:wanandroid/model/home_banner_model.dart';
import 'package:wanandroid/page/web_page.dart';

class HomePageController extends GetxController {
  static const String tag = 'HomePageController';

  late RefreshController refreshController;

  ///首页数据分页的第一页
  var urlIndex = 0;
  var articles = RxList<Article>();

  ///接口返回的页码,接口返回的第一条数据是1，但是如果设置1那么初次请求接口需要处理是够进行自增
  var currentPage = 0;

  int totalPages = 999999;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: true);
  }

  void onClickBanner(MyBanner banner) {
    Log.d('HomePageController', banner.title! + banner.url!);
  }

  void onClickArticle(Article articles) {
    Log.d(tag, '网页链接${articles.link!}');
    // String link = articles.link!;
    // if(link.contains('https://www.')){
    //   link = link.replaceRange(0, 12, 'https://');
    // }else if(link.contains('http://www.')){
    //   link = link.replaceRange(0, 11, 'http://');
    // }
    Get.to(()=>WebPage(),arguments: articles.link!);
  }

  Future<void> requestData(bool isRefresh) async {
    if (isRefresh) {
      urlIndex = 0;
    } else {
      if (currentPage == totalPages) return;
    }
    dioHelper.get('/article/list/$urlIndex/json', callBack: (response) {
      if (isRefresh) {
        refreshController.refreshCompleted();
      } else {
        refreshController.loadComplete();
      }
      var jsonMap = jsonDecode(response.data);
      if (jsonMap['errorCode'] == 0) {
        List<Article> result = HomeArticleModel.fromJson(jsonMap).data!.articles!;
        totalPages = HomeArticleModel.fromJson(jsonMap).data!.pageCount!;
        if (isRefresh) {
          articles.value = result;
        } else {
          currentPage++;
          articles.addAllIf(!isRefresh, result);
        }
      }
    });
  }
}
