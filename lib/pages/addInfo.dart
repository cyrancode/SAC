// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/registrationController.dart';
import 'package:sac/pages/loginScreen.dart';
import 'package:sac/pages/registerCarType.dart';
import 'package:searchfield/searchfield.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          "SAC: Information additionnelle",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/logo.jpeg",
                  width: width / 3,
                ),
              ),
              SizedBox(height: 40),

              Text(
                "Contact",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: registerController.contact.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Enter your contact",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 25),

              // SizedBox(height: 40),
              Text(
                "Adress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: registerController.address.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    hintText: "Enter your address",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 25),
              Text(
                "Nom de l'Asureur",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Container(
    
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
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
                  controller: registerController.asureur.value,
                  suggestions: ['James', 'Christian', 'Marvin', 'John']
                      .map((e) => SearchFieldListItem(e,
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 18),
                          )))
                      .toList(),
                ),
              ),
              SizedBox(height: 25),

              GestureDetector(
                onTap: () {
                  // registerController.createUser(context);
                  Get.to(() => CarTypeRegisterScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      // color: Color.fromRGBO(0, 91, 228, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Suivant",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Row(
                children: [
                  Text("Already have an account ?"),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
