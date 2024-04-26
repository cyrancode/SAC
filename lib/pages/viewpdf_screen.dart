import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:io';

class PdfViewScreen extends StatelessWidget {
  final String pdfPath;

  const PdfViewScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
