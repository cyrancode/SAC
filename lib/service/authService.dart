import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/pages/homeScreen.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> registerUser(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid; // Get the user ID
      return {'user': userCredential.user, 'userId': userId};
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>?> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid; // Get the user ID
      return {'user': userCredential.user, 'userId': userId};
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void signOutUser(context) async {
    try {
      await firebaseAuth.signOut();
      Get.to(() => HomeScreen());
      print("Sign out successful!");
    } on FirebaseAuthException catch (e) {
      // Handle errors from sign out
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );

      // print("Error signing out: ${e.message}");
    }
  }
}
