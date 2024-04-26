import 'package:flutter/material.dart';
import 'package:sac/pages/splashScreen.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart AC',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // Set your initial screen here
      // Define your routes (optional)
      // initialRoute: '/', // You can define an initial route if needed
      // getPages: [ // You can define named routes using GetPage
      //   GetPage(name: '/', page: () => HomeScreen()),
      //   GetPage(name: '/details', page: () => DetailsScreen()),
      // ],
    );
  }
}
