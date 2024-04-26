import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
// FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<DocumentSnapshot> getUserbyDocId(String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();
  }
}
