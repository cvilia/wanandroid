class HomeBannerModel {
  List<MyBanner>? banners;
  int? errorCode;
  String? errorMsg;

  HomeBannerModel({
      this.banners,
      this.errorCode, 
      this.errorMsg});

  HomeBannerModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      banners = [];
      json["data"].forEach((v) {
        banners?.add(MyBanner.fromJson(v));
      });
    }
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (banners != null) {
      map["data"] = banners?.map((v) => v.toJson()).toList();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }

}

/// desc : "扔物线"
/// id : 29
/// imagePath : "https://wanandroid.com/blogimgs/31c2394c-b07c-4699-afd1-95aa7a3bebc6.png"
/// isVisible : 1
/// order : 0
/// title : "View 嵌套太深会卡？来用 Jetpack Compose，随便套&mdash;&mdash;Compose 的 Intrinsic Measurement"
/// type : 0
/// url : "https://www.bilibili.com/video/BV1ZA41137gr"

class MyBanner {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  MyBanner({
      this.desc, 
      this.id, 
      this.imagePath, 
      this.isVisible, 
      this.order, 
      this.title, 
      this.type, 
      this.url});

  MyBanner.fromJson(dynamic json) {
    desc = json["desc"];
    id = json["id"];
    imagePath = json["imagePath"];
    isVisible = json["isVisible"];
    order = json["order"];
    title = json["title"];
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = desc;
    map["id"] = id;
    map["imagePath"] = imagePath;
    map["isVisible"] = isVisible;
    map["order"] = order;
    map["title"] = title;
    map["type"] = type;
    map["url"] = url;
    return map;
  }

}