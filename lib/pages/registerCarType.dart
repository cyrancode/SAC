// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sac/controllers/registrationController.dart';
import 'package:sac/pages/questionaire.dart';

class CarTypeRegisterScreen extends StatefulWidget {
  const CarTypeRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CarTypeRegisterScreen> createState() => _CarTypeRegisterScreenState();
}

class _CarTypeRegisterScreenState extends State<CarTypeRegisterScreen> {
  final RegisterController registerController = Get.put(RegisterController());
  String selectedOption = '';
  String imatricullation = '';

  bool isLoading = false;

  void checkF(value) {
    if (selectedOption == 'Voiture' ||
        selectedOption == 'Camion' ||
        selectedOption == 'Deux-roues') {
      print(selectedOption);
      showDialog(
        context: context,
        builder: ((context) => Dialog(
              child: Container(
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: registerController.imatricule.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Entrez votre immatriculation',
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Cancle",
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ),
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
      // Get.to(() => SecondScreen());
    } else {
      registerController.imatricule.value.text = '';
      // Get.to(() => SecondScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
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
              ),
            )
          ],
        ),
        title: Text(
          "SAC-Type du véhicule",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  VeihcleCardWidget(
                    imagePath: 'assets/car.jpg',
                    title: "Voiture",
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Voiture';
                      });
                      registerController.carType.value.text = selectedOption;
                      checkF(selectedOption);

                      // Get.to(() => SecondScreen());
                    },
                    isSelected: selectedOption == 'Voiture',
                  ),
                  Spacer(),
                  VeihcleCardWidget(
                    imagePath: 'assets/camion.jpg',
                    title: 'Camion',
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Camion';
                      });
                      registerController.carType.value.text = selectedOption;
                      checkF(selectedOption);
                      // print(selectedOption);
                      // Get.to(() => SecondScreen());
                    },
                    isSelected: selectedOption == 'Camion',
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  VeihcleCardWidget(
                    imagePath: 'assets/bike.jpg',
                    title: "Deux-roues",
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Deux-roues';
                      });
                      registerController.carType.value.text = selectedOption;
                      checkF(selectedOption);
                      // print(selectedOption);
                      // Get.to(() => SecondScreen());
                    },
                    isSelected: selectedOption == 'Deux-roues',
                  ),
                  Spacer(),
                  VeihcleCardWidget(
                    imagePath: 'assets/bicycle.jpg',
                    title: 'Bicycle',
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Bicycle';
                      });
                      registerController.carType.value.text = selectedOption;
                      checkF(selectedOption);
                      // print(selectedOption);
                      // Get.to(() => SecondScreen());
                    },
                    isSelected: selectedOption == 'Bicycle',
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  VeihcleCardWidget(
                    imagePath: 'assets/trotinette.jpg',
                    title: "Trotinette",
                    onPressed: () {
                      setState(() {
                        selectedOption = 'Trotinette';
                      });
                      registerController.carType.value.text = selectedOption;
                      checkF(selectedOption);
                      // print(selectedOption);
                      // Get.to(() => SecondScreen());
                    },
                    isSelected: selectedOption == 'Trotinette',
                  ),
                  Spacer(),
                ],
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        registerController.createUser(context);
                        // Get.to(() => CarTypeRegisterScreen());
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
                          "Submit",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class VeihcleCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  const VeihcleCardWidget({
    required this.imagePath,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Colors.blue
                : Colors.grey, // Highlight when selected
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    child: isSelected
                        ? Icon(Icons.check,
                            size: 16,
                            color: Colors.blue) // Show check icon when selected
                        : null, // Show nothing when not selected
                  ),
                ],
              ),
            ),
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: isSelected
                    ? Colors.blue
                    : Colors.black, // Highlight text when selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}
