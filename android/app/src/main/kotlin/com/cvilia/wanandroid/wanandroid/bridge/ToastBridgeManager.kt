package com.cvilia.wanandroid.wanandroid.bridge

import android.widget.Toast
import com.cvilia.wanandroid.wanandroid.MainActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * created by: cvilia
 * e-mail: cvilia@163.com
 * date: 2021-06-20-12:53
 * describe:
 */
class ToastBridgeManager {
    companion object{
        private const val toastChannelName:String = "com.cvilia.wanandroid.ui/toast"
        @JvmStatic
        fun init(flutterEngine: FlutterEngine,activity: MainActivity) {
            MethodChannel(flutterEngine.dartExecutor, toastChannelName).setMethodCallHandler { call, result ->
                val message = call.arguments as String
                when(call.method){
                    "short"->Toast.makeText(activity,message,Toast.LENGTH_SHORT).show()
                    "long"->Toast.makeText(activity,message,Toast.LENGTH_LONG).show()
                }
            }
        }
    }
}