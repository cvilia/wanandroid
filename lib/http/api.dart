class Api {
  static const String SERVER = 'https://www.wanandroid.com';

  ///获取公众号列表 get
  static const String WX_ARTICLE = '/wxarticle/chapters/json';

  ///查看某个公众号的历史数据 get
  ///公众号 ID：拼接在 url 中，eg:408
  ///公众号页码：拼接在url 中，eg:1
  static const String VIEW_WX_ARTICLE_HISTORY = '/wxarticle/list/408/1/json';

  ///在某个公众号中搜索历史文章 get
  ///k : 字符串，eg:Java
  ///公众号 ID：拼接在 url 中，eg:405
  ///公众号页码：拼接在url 中，eg:1
  static const String SEARCH_WX_ARTICLE_HISTORY = '/wxarticle/list/405/1/json?k=Java';


}
