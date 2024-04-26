// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/constatController.dart';
import 'package:sac/pages/loginScreen.dart';
import 'package:sac/pages/veihcleType.dart';
import 'package:searchfield/searchfield.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ConstatController constatController = Get.put(ConstatController());

  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController asurerController = TextEditingController();

  void submitForm() {
    constatController.nameController.value = nameController;
    constatController.telController.value = telController;
    constatController.emailController.value = emailController;
    constatController.addressController.value = addressController;
    constatController.asurer.value = asurerController;
  }

  @override
  Widget build(BuildContext context) {
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
            "SAC: Information Personnel",
            style: TextStyle(color: Colors.black),
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                icon: Icon(
                  Icons.login,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: height * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Select Asurer",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  )
                                ]),
                            child: SearchField(
                              hint: "Search",
                              searchInputDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: asurerController,
                              suggestions:
                                  ['James', 'Christian', 'Marvin', 'John']
                                      .map((e) => SearchFieldListItem(e,
                                          child: Text(
                                            e,
                                            style: TextStyle(fontSize: 18),
                                          )))
                                      .toList(),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Nom du conductuer",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Votre Nom',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Telephone",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: telController,
                              decoration: InputDecoration(
                                hintText: 'Votre Contact',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Ex: test@gmail.com',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: 'Votre Address',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.8),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              submitForm();
                              Get.to(() => VeichleTypeScreen());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Suivant',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.skip_next,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
