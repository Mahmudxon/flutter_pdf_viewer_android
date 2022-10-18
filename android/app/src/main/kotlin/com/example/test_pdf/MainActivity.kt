package com.example.test_pdf

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    private var firstTime = true
    private val pdfView: NativePdfView by lazy { NativePdfView(this) }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        if(firstTime) {
        flutterEngine.platformViewsController.registry.registerViewFactory(
            "pdf_view1",
            PdfViewFactory(pdfView)
        )
        firstTime = false
        }
    }
}
