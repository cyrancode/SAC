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
//                 'Choose where to take the images',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               SizedBox(height: 20.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 60),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         final pickedImages = await ImagePicker().pickMultiImage();
//                         if (pickedImages != null) {
//                           setState(() {
//                             // Update the state with the picked images
//                             constatController.setImages(pickedImages.map((pickedImage) => File(pickedImage.path)).toList());
//                           });
//                         }
//                         Navigator.pop(context); // Close the bottom sheet
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 60,
//                             color: Colors.blue,
//                           ),
//                           Text(
//                             "Gallery",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                       onTap: () async {
//                         final pickedImages = await ImagePicker().pickMultiImage();
//                         if (pickedImages != null) {
//                           setState(() {
//                             // Update the state with the picked images
//                             constatController.setImages(pickedImages.map((pickedImage) => File(pickedImage.path)).toList());
//                           });
//                         }
//                         Navigator.pop(context); // Close the bottom sheet
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





// here is the controller

// import 'dart:io';
// import 'package:get/get.dart';

// class ConstatController extends GetxController {
//   // Define the properties to hold the form data
//   var asurer = ''.obs;
//   var nameController = TextEditingController().obs;
//   var telController = TextEditingController().obs;
//   var emailController = TextEditingController().obs;
//   var addressController = TextEditingController().obs;
//   var observationController = TextEditingController().obs;

//   // Define the property to hold the selected images
//   var selectedImages = RxList<File>([]);

//   // Method to set the images
//   void setImages(List<File> images) {
//     selectedImages.value = images;
//   }

//   // Method to display data (assuming you have a method for this)
//   void displayData() {
//     // Your implementation for displaying data
//   }
// }


// and here is how to display them

// GestureDetector(
//   onTap: () {
//     _showBottomSheet(context);
//   },
//   child: Obx(() {
//     // Use Obx to listen for changes in selectedImages
//     final List<File> selectedImages = constatController.selectedImages;
//     return Container(
//       height: height / 3.5,
//       width: width,
//       decoration: BoxDecoration(
//         color: Colors.grey[400],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: selectedImages.isNotEmpty
//           ? ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: selectedImages.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.all(5),
//                   child: Image.file(
//                     selectedImages[index],
//                     fit: BoxFit.cover,
//                     width: 100,
//                     height: 100,
//                   ),
//                 );
//               },
//             )
//           : Icon(
//               Icons.camera_alt_outlined,
//               size: 100,
//             ),
//     );
//   }),
// ),
