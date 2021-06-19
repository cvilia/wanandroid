package com.cvilia.wanandroid.wanandroid

import com.cvilia.wanandroid.wanandroid.bridge.WanAndroidBridgeManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        WanAndroidBridgeManager.init(flutterEngine)
    }

}
