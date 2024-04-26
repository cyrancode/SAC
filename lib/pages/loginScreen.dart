// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/loginController.dart';
import 'package:sac/pages/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  bool _obscureText = true;

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
          "SAC: Login Screen",
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
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: loginController.emailController.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter Email",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 25),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: loginController.passwordController.value,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                maxLength: 20,
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  loginController.loginUser(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      // color: Color.fromRGBO(0, 91, 228, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Submit",
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
                  Text("Don't have an account ?"),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: Text(
                      "Register",
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
