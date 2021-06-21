import 'package:get/get.dart';
import 'package:wanandroid/config/page_status.dart';

abstract class BaseController extends GetxController {
  var loginStatus = false.obs;
  var pageStatus = PageStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init();
}
