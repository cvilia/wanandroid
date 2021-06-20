import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/base/base_stateless_widget.dart';
import 'package:wanandroid/controller/home_page_controller.dart';
import 'package:wanandroid/model/home_article_model.dart';
import 'package:wanandroid/widget/custom_scroll_behavior.dart';
import 'package:wanandroid/widget/swiper.dart';

class HomePage extends BaseStatelessWidget<HomePageController> {
  @override
  getController() {
    return Get.put(HomePageController());
  }

  @override
  Widget pageContent() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Obx(() {
        List<Article> articles = controller.articles;
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.requestData(true),
          onLoading: () => controller.requestData(false),
          enablePullUp: true,
          child: articles.isEmpty
              ? Container()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 150,
                        child: Swiper(
                          onItemClick: (banner) => controller.onClickBanner(banner),
                        ),
                      ),
                    ),
                    SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          return GestureDetector(
                            onTap: () => controller.onClickArticle(articles[index]),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        articles[index].superChapterName!,
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),
                                    Text(
                                      articles[index].title!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      articles[index].author! == '' ? '未知作者' : articles[index].author!,
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        articles[index].niceDate!,
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: articles.length,
                      ),
                      itemExtent: 100,
                    )
                  ],
                ),
        );
      }),
    );
  }
}
