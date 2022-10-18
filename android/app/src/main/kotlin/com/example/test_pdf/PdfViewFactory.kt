package com.example.test_pdf

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class PdfViewFactory(private val view: NativePdfView) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        if (args is Map<*, *>) {
            Log.d("TTT", "create: ${args["file_url"]}")
            args["file_url"]?.let { view.load(it.toString()) }
            args["file"]?.let {
                if (it is ByteArray)
                    view.load(it)
            }
        }
        return view
    }
}