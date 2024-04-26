import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  static String userIdKey = "USERKEY";
  static String usernameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userContactKey = "USERCONTACTKEY";
  static String userAddressKey = "USERADDRESSKEY";
  static String asureurKey = "ASSUREURKEY";
  static String cartTypeKey = "CARTYPEKEY";
  static String imatriculeKey = "IMATRICULEKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(usernameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserContact(String getUserContact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userContactKey, getUserContact);
  }

  Future<bool> saveUserAddress(String getUserAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userAddressKey, getUserAddress);
  }

  Future<bool> saveCarType(String getCarType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(cartTypeKey, getCarType);
  }

  Future<bool> saveImatricule(String getImatricule) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(imatriculeKey, getImatricule);
  }

  Future<bool> saveAssureur(String getAssureur) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(asureurKey, getAssureur);
  }

// get methods
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userContactKey);
  }

  Future<String?> getUserAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userAddressKey);
  }

  Future<String?> getCarType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(cartTypeKey);
  }

  Future<String?> getImatricule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(imatriculeKey);
  }

  Future<String?> getAssureur() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(asureurKey);
  }

  // static Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear(); // Clear all data in shared preferences
  // }
}
