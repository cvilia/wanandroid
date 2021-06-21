package com.cvilia.wanandroid.wanandroid

import com.tencent.mmkv.MMKV
import io.flutter.app.FlutterApplication

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-06-21-17:43
 * describe：描述
 *
 */
class MyApplication:FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        init()
    }

    private fun init() {
        MMKV.initialize(this)
    }

}