// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sac/pages/firstPage.dart';
import 'package:sac/pages/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sac/pages/questionaire.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    User? currentUser = _auth.currentUser;
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      // Navigate based on currentUser or some logic
      if (currentUser != null) {
        Get.to(() => SecondScreen());
      } else {
        Get.to(() => HomeScreen());
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Image(
              image: AssetImage(
                "assets/logo.jpeg",
              ),
              height: 400,
              width: 600,
            ),
            // SizedBox(height: 20),
            Text(
              "SAC",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                  color: Color.fromARGB(255, 112, 11, 148),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
