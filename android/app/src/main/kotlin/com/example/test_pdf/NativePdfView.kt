package com.example.test_pdf

import android.content.Context
import android.view.View
import com.github.barteksc.pdfviewer.PDFView
import io.flutter.plugin.platform.PlatformView
import java.io.File

class NativePdfView(context: Context) : PlatformView {

    private var pdfView: PDFView? = null

    override fun getView(): View = pdfView!!


    init {
        pdfView = PDFView(context, null)
    }

    fun load(url: String) {
        pdfView?.fromFile(File(url))?.load()
    }

    fun load(data: ByteArray) {
        pdfView?.fromBytes(data)?.load()
    }

    override fun dispose() {

    }
}