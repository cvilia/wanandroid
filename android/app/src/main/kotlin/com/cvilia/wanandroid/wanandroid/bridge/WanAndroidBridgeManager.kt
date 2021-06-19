package com.cvilia.wanandroid.wanandroid.bridge

import io.flutter.embedding.engine.FlutterEngine

/**
 * created by: cvilia
 * e-mail: cvilia@163.com
 * date: 2021-06-19-2:35
 * describe:
 */
class WanAndroidBridgeManager {
    companion object {
        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            LogBridgeManager.init(flutterEngine)
        }
    }
}