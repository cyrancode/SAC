// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class PDFScreen extends StatefulWidget {
//   const PDFScreen({super.key});

//   @override
//   State<PDFScreen> createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> {

// Future<void> generatePDF(BuildContext context, String name, String email) async {
//   final pdf = PdfDocument();
//   final page = pdf.pages.addPage();

//   // Create a PDF layout with widgets (e.g., pw.Text, pw.Paragraph)
//   page.addText('Name: $name');
//   page.addText('Email: $email');

//   // Add more text, images, tables, etc. based on your form data

//   final directory = await getApplicationDocumentsDirectory();
//   final file = File('${directory.path}/form_data.pdf');
//   await file.writeAsBytes(pdf.save());

//   // Show a success message or navigate to another screen
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('PDF generated successfully!'),
//     ),
//   );
// }



//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


