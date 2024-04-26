// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/pages/firstPage.dart';
import 'package:sac/pages/registerScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SAC-Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Application des assureurs Camerounais",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            Image.asset(
              "assets/logo.jpeg",
              width: 400,
              height: 350,
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Get.to(()=>RegisterScreen());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Cree Un Compte",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to(() => FirstScreen());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Continue sans Compte",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
