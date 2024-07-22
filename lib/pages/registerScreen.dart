// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/registrationController.dart';
import 'package:sac/pages/addInfo.dart';
import 'package:sac/pages/loginScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final RegisterController registerController = Get.put(RegisterController());
  bool _obscureText = true;
  bool isLoading = false;

//   final passwordValidator = PasswordValidator(
//     minLength: 8,
//     uppercaseCharCount: 1,
//     lowercaseCharCount: 1,
//     symbolCharCount: 1,
//     digitCharCount: 1,
// );

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
          "SAC: Register Screen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  "Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: registerController.name.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter your name",
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 25),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  controller: registerController.email.value,
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Password must not be empty';
                    }
                    return null;
                  },
                  controller: registerController.password.value,
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
                FlutterPwValidator(
                  key: validatorKey,
                  controller: registerController.password.value,
                  minLength: 8,
                  uppercaseCharCount: 2,
                  lowercaseCharCount: 3,
                  numericCharCount: 2,
                  specialCharCount: 1,
                  normalCharCount: 3,
                  width: 400,
                  height: 200,
                  onSuccess: () {
                    print("MATCHED");
                    ScaffoldMessenger.of(context).showSnackBar(
                        new SnackBar(content: new Text("Password is matched")));
                  },
                  onFail: () {
                    print("NOT MATCHED");
                  },
                ),
                SizedBox(height: 25),
                isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoading = true;
                          });

                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            Get.to(() => AddInfo());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }

                          setState(() {
                            isLoading = false;
                          });
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
      ),
    );
  }
}
