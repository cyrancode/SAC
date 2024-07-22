// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sac/controllers/constatController.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sac/pages/viewInfo.dart';
import 'package:sac/pages/viewpdf_screen.dart';

class AdditionalObservations extends StatefulWidget {
  const AdditionalObservations({super.key});

  @override
  State<AdditionalObservations> createState() => _AdditionalObservationsState();
}

class _AdditionalObservationsState extends State<AdditionalObservations> {
  final ConstatController constatController = Get.put(ConstatController());
  TextEditingController observationController = TextEditingController();

  String pdfPath = '';
  Future<String> generatePDF() async {
    final pdf = pw.Document();

    // Add content to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Asurer: ${constatController.asurer.value}'),
              pw.Text('Name: ${constatController.nameController.value.text}'),
              pw.Text(
                  'Telephone: ${constatController.telController.value.text}'),
              pw.Text('Email: ${constatController.emailController.value.text}'),
              pw.Text(
                  'Address: ${constatController.addressController.value.text}'),
              pw.Text(
                  'Observation: ${constatController.observationController.value.text}'),
            ],
          );
        },
      ),
    );

    // Get the document bytes
    final pdfBytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();

    final file = File('${directory.path}/form_data.pdf');
    await file.writeAsBytes(pdfBytes);
    pdfPath = file.path;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF generated successfully!'),
      ),
    );
    return file.path;
  }

  void submitForm() async {
    constatController.observationController.value = observationController;
    constatController.displayData();

    // final pdfPath = await generatePDF();

    Get.to(() => ViewInfoScreen());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ))
          ],
        ),
        title: Text(
          'SAC: Observation Complementaire',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                controller: observationController,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entre les observation Complementaire',
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Images",
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Left Picture",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Obx(() {
                              // Use Obx to listen for changes in selectedImage
                              final selectedImage =
                                  constatController.selectedImage.value;
                              return Container(
                                height: height / 4.5,
                                width: width / 2.3,
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
                                    : Icon(
                                        Icons.camera_alt_outlined,
                                        size: 60,
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Right Picture",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheetRight(context);
                            },
                            child: Obx(() {
                              // Use Obx to listen for changes in selectedImage
                              final selectedImageRight =
                                  constatController.selectedImageRight.value;
                              return Container(
                                height: height / 4.5,
                                width: width / 2.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // Display the selected image if it's not null
                                child: selectedImageRight != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          selectedImageRight,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Icon(
                                        Icons.camera_alt_outlined,
                                        size: 60,
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Front Picture",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheetFront(context);
                            },
                            child: Obx(() {
                              // Use Obx to listen for changes in selectedImage
                              final selectedImageFront =
                                  constatController.selectedImageFront.value;
                              return Container(
                                height: height / 4.5,
                                width: width / 2.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // Display the selected image if it's not null
                                child: selectedImageFront != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          selectedImageFront,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Icon(
                                        Icons.camera_alt_outlined,
                                        size: 60,
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Back Picture",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheetBack(context);
                            },
                            child: Obx(() {
                              // Use Obx to listen for changes in selectedImage
                              final selectedImageBack =
                                  constatController.selectedImageBack.value;
                              return Container(
                                height: height / 4.5,
                                width: width / 2.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // Display the selected image if it's not null
                                child: selectedImageBack != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          selectedImageBack,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Icon(
                                        Icons.camera_alt_outlined,
                                        size: 60,
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  submitForm();
                  // Get.to(AdditionalObservations());
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of the bottom sheet
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Choose where to take the image',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImage(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImage(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // Add other widgets as needed
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetRight(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of the bottom sheet
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Choose where to take the image',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageRight(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageRight(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // Add other widgets as needed
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetFront(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of the bottom sheet
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Choose where to take the image',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageFront(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageFront(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // Add other widgets as needed
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetBack(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of the bottom sheet
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Choose where to take the image',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageBack(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              // Update the state with the picked image
                              constatController
                                  .setImageBack(File(pickedImage.path));
                            });
                          }
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 60,
                              color: Colors.blue,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // Add other widgets as needed
              ],
            ),
          ),
        );
      },
    );
  }
}





// void _showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         // Customize the appearance of the bottom sheet
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Choose where to take the image',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               SizedBox(height: 20.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 60),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         // ImagePicker().pickImage(source: ImageSource.gallery);

//                         final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//                         if (pickedImage != null) {
//                           setState(() {
//                             // Update the state with the picked image
//                             constatController.setImage(File(pickedImage.path));
//                           });
//                         }
//                         Navigator.pop(context); 
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 60,
//                             color: Colors.blue,
//                           ),
//                           Text(
//                             "Galery",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         ImagePicker().pickImage(source: ImageSource.camera);
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.camera_alt_outlined,
//                             size: 60,
//                             color: Colors.blue,
//                           ),
//                           Text(
//                             "Camera",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               )
//               // Add other widgets as needed
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
