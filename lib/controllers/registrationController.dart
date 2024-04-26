import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/pages/loginScreen.dart';
import 'package:sac/service/authService.dart';

import 'package:sac/service/database.dart';


class RegisterController extends GetxController {
  var name = TextEditingController().obs;
  var contact = TextEditingController().obs;
  var email = TextEditingController().obs;
  var address = TextEditingController().obs;
  var password = TextEditingController().obs;
  
  var asureur = TextEditingController().obs;
  var carType = TextEditingController().obs;
  var imatricule = TextEditingController().obs;

  createUser(context) async {
    Map<String, dynamic>? result = await AuthService()
        .registerUser(email.value.text, password.value.text, context);

    if (result != null && result['user'] != null) {
      User? user = result['user'];
      String userId = result['userId'];

      String uname = name.value.text;

      Map<String, dynamic> userInfoMap = {
        "userId": userId,
        "name": uname,
        "email": email.value.text,
        "address": address.value.text,
        "contact": contact.value.text,
        "asureur": asureur.value.text,
        "carType": carType.value.text,
        "imatricule": imatricule.value.text,
      };
      print(userInfoMap);
      final userSave =
          await DatabaseMethods().addUserDetails(userInfoMap, userId);
      if (userSave != null) {
        print("Save User");
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration successful")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration failed")));
    }
  }
}
