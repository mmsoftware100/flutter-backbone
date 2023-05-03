package com.iadx.coffer

import android.content.Context
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(dartChannel: MethodChannel) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    lateinit var channel: MethodChannel

    // initializer block
    init {
        channel = dartChannel
    }


    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context, viewId, creationParams, channel)
    }
}
