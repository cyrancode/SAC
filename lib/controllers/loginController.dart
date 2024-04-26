import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sac/pages/questionaire.dart';
import 'package:sac/service/authService.dart';
import 'package:sac/service/database.dart';
import 'package:sac/service/shared_pref.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var id = ''.obs;
  var name = ''.obs;
  var contact = ''.obs;
  var email = ''.obs;
  var address = ''.obs;
  var asureur = ''.obs;
  var carType = ''.obs;
  var imatricule = ''.obs;

  loginUser(context) async {
    Map<String, dynamic>? result = await AuthService().login(
        emailController.value.text, passwordController.value.text, context);

    if (result != null && result['user'] != null) {
      User? user = result['user'];
      String userId = result['userId'];
      print('User login');

      DocumentSnapshot documentSnapshot =
          await DatabaseMethods().getUserbyDocId(userId);

      // Check if user data exists
      if (documentSnapshot.exists) {
        // Access user data
        Map<String, dynamic> documentSnapshotMap =
            documentSnapshot.data() as Map<String, dynamic>;

        name.value = "${documentSnapshotMap['name']}";
        email.value = "${documentSnapshotMap['email']}";
        id.value = "${documentSnapshotMap['userId']}";
        address.value = "${documentSnapshotMap['address']}";
        contact.value = "${documentSnapshotMap['contact']}";
        asureur.value = "${documentSnapshotMap['asureur']}";
        carType.value = "${documentSnapshotMap['carType']}";
        imatricule.value = "${documentSnapshotMap['imatricule']}";

        await SharedPrefrenceHelper().saveUserId(id.value);
        await SharedPrefrenceHelper().saveUserName(name.value);
        await SharedPrefrenceHelper().saveUserEmail(email.value);
        await SharedPrefrenceHelper().saveAssureur(asureur.value);
        await SharedPrefrenceHelper().saveCarType(carType.value);
        await SharedPrefrenceHelper().saveImatricule(imatricule.value);
        await SharedPrefrenceHelper().saveUserAddress(address.value);
        await SharedPrefrenceHelper().saveUserContact(contact.value);

        Get.to(() => SecondScreen());

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Successfully logged in as ${documentSnapshotMap['username']}")));

        // print(
        //     'User data: $documentSnapshotMap');
      } else {
        print('User data not found');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User with provided credentials not found')));
    }
  }
}
