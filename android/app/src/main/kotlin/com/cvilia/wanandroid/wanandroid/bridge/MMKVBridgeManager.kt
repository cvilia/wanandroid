package com.cvilia.wanandroid.wanandroid.bridge

import com.cvilia.wanandroid.wanandroid.util.MMKVUtil
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-06-21-17:44
 * describe：描述
 *
 */
class MMKVBridgeManager {
    companion object {
        private const val mmkvChannel = "com.cvilia.wanandroid.io/mmkv"

        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            MethodChannel(
                flutterEngine.dartExecutor,
                mmkvChannel
            ).setMethodCallHandler { call, result ->
                val map = call.arguments as Map<*, *>
                when (call.method) {
                    "setInt" ->
                        result.success(MMKVUtil.setInt(map["value"] as Int, map["key"] as String))
                    "setString" ->
                        result.success(MMKVUtil.setString(map["value"] as String, map["key"] as String))
                    "setBool" ->
                        result.success(MMKVUtil.setBool(map["value"] as Boolean, map["key"] as String))
                    "getInt" -> {
                        val intValue = MMKVUtil.getInt(map["default"] as Int, map["key"] as String)
                        result.success(intValue)
                    }
                    "getString" -> {
                        val stringValue =
                            MMKVUtil.getString(map["default"] as String, map["key"] as String)
                        result.success(stringValue)
                    }
                    "getBool" -> {
                        val boolValue =
                            MMKVUtil.getBool(map["default"] as Boolean, map["key"] as String)
                        result.success(boolValue)
                    }
                }
            }
        }
    }
}