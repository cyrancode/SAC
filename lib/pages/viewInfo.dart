// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, use_build_context_synchronously, unnecessary_nullable_for_final_variable_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sac/controllers/constatController.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sac/pages/viewpdf_screen.dart';

class ViewInfoScreen extends StatelessWidget {
  ViewInfoScreen({super.key});

  final ConstatController constatController = Get.put(ConstatController());

  final pdf = pw.Document();

// '/data/user/0/com.example.sac/app_flutter/example.pdf'

  // final selectedImage = Get.put(ConstatController().selectedImage.value);

  _generatePdf() async {
    pdf.addPage(
      
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          // return pw.Center(child: pw.Text("Hello world"));

          return [
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 22),
              child: pw.Container(
                child: pw.Column(
                  children: [
                    pw.Container(
                      alignment: pw.Alignment.center,
                      margin: pw.EdgeInsets.only(top: 20),
                      child: pw.Text(
                        "Accident Report",
                        style: pw.TextStyle(
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.blue),
                      ),
                    ),
                    pw.SizedBox(height: 15),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.symmetric(vertical: 5),
                      decoration: pw.BoxDecoration(color: PdfColors.grey),
                      child: pw.Text(
                        "Personal Info",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding:
                          pw.EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              pw.Text(
                                "Name",
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Spacer(),
                              pw.Text(
                                constatController.nameController.value.text,
                                style: pw.TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Contact",
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                              pw.Spacer(),
                              pw.Text(
                                constatController.telController.value.text,
                                style: pw.TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Email",
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                              pw.Spacer(),
                              pw.Text(
                                constatController.emailController.value.text,
                                style: pw.TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Address",
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                              pw.Spacer(),
                              pw.Text(
                                constatController.addressController.value.text,
                                style: pw.TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Asurer",
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                              pw.Spacer(),
                              pw.Text(
                                constatController.asurer.value.text,
                                style: pw.TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.symmetric(vertical: 5),
                      decoration: pw.BoxDecoration(color: PdfColors.grey300),
                      child: pw.Text(
                        "Questionaire",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding:
                          pw.EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          ...constatController.questionionaire.map(
                            (question) {
                              return pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    // "Estimate the distance between your vehicle and the other vehicle at the time of impact:",
                                    question['question'],
                                    style: pw.TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    question['answer'],
                                    style: pw.TextStyle(
                                      fontSize: 19,
                                      color: PdfColors.grey100,
                                    ),
                                  ),
                                  pw.SizedBox(height: 20)
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.symmetric(vertical: 5),
                      decoration: pw.BoxDecoration(color: PdfColors.grey300),
                      child: pw.Text(
                        "Additional Observation",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding:
                          pw.EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: pw.Text(
                        constatController.observationController.value.text,
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      padding: pw.EdgeInsets.symmetric(vertical: 5),
                      decoration: pw.BoxDecoration(color: PdfColors.grey300),
                      child: pw.Column(
                        children: [
                          pw.Text(
                            "Image of Area",
                            style: pw.TextStyle(
                                fontSize: 20,
                                fontWeight: pw.FontWeight.normal,
                                color: PdfColors.black),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(horizontal: 20),
                            child: pw.Container(
                              // height: height / 3,
                              // width: width,
                              decoration: pw.BoxDecoration(
                                color: PdfColors.grey400,
                                borderRadius: pw.BorderRadius.circular(20),
                              ),
                              // Display the selected image if it's not null
                              child:
                                  constatController.selectedImage.value != null
                                      ? pw.ClipRRect(
                                          // borderRadius: pw.BorderRadius.circular(20),
                                          child: pw.Image(
                                            pw.MemoryImage(constatController
                                                .selectedImage.value!
                                                .readAsBytesSync()),
                                            fit: pw.BoxFit.cover,
                                          ),
                                        )
                                      : pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          children: [
                                            // pw.Icon(
                                            //   pw.Icons.hourglass_empty_outlined,
                                            //   size: 60,
                                            // ),
                                            pw.Text(
                                              "No Image Selected",
                                              style: pw.TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ];
        },
      ),
    );
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/example.pdf');
    // final file = File("example.pdf");
    final imageSave = await file.writeAsBytes(await pdf.save());
    if (imageSave != null) {
      print("pdf was saved successfully");
      print(imageSave);
      final String? pdfPath = file.path;

      if (pdfPath != null) {
        Get.to(() => PdfViewScreen(pdfPath: pdfPath));
      }
    } else {
      print("Image was not saved");
    }

    // await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Accident Report",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Text(
                    "Personal Info",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            constatController.nameController.value.text,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Contact",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            constatController.telController.value.text,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            constatController.emailController.value.text,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            constatController.addressController.value.text,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Asurer",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            constatController.asurer.value.text,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Text(
                    "Questionaire",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...constatController.questionionaire.map(
                        (question) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "Estimate the distance between your vehicle and the other vehicle at the time of impact:",
                                question['question'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                question['answer'],
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 2, 50, 205),
                                ),
                              ),
                              SizedBox(height: 20)
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Text(
                    "Additional Observation",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    constatController.observationController.value.text,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Text(
                    "Image of Area",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() {
                    // Use Obx to listen for changes in selectedImage
                    final selectedImage = constatController.selectedImage.value;
                    return Container(
                      height: height / 3,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // Display the selected image if it's not null
                      child: selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.hourglass_empty_outlined,
                                  size: 60,
                                ),
                                Text(
                                  "No Image Selected",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _generatePdf();
                    // _navigateToPdfScreen(context);
                    // _submitAnswers();
                    // Get.to(() => AdditionalObservations());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
