class GlobalApp {
  static bool get isRelease => bool.fromEnvironment('dart.vm.product');

  static Future init() async {}
}
