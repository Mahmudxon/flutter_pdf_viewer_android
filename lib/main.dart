import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? path;
  const MyHomePage({
    Key? key,
    required this.title,
    this.path,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    if (widget.path != null) {
      pdf = widget.path;
    }
    super.initState();
  }

  String? pdf;
  // Uint8List? buffer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pdf != null
          ? AndroidView(
              viewType: 'pdf_view1',
              creationParams: <String, dynamic>{'file_url': pdf},
              creationParamsCodec: const StandardMessageCodec(),
            )
          : const Center(
              child: Text('Select Pdf File'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getFile(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      // pdf = result.files[0].path!;
      // var file = File(result.files[0].path!);
      // buffer = await file.readAsBytes();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: widget.title,
            path: result.files[0].path!,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }
}
