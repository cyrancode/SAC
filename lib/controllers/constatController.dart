import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ConstatController extends GetxController {
  var asurer = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var telController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var observationController = TextEditingController().obs;
  var questionionaire = [].obs;
  var accLocation = ''.obs;

  late RxString lat = ''.obs;
  late RxString long = ''.obs;
  var address_name = ''.obs;

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    // Test if location services are enabled.

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get the placemarks for the current position
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Extract the first placemark to get the name of the location
    Placemark placemark = placemarks[0];
    String name = placemark.name ?? '';
    String street = placemark.street ?? '';
    String locality = placemark.locality ?? '';
    String administrativeArea = placemark.administrativeArea ?? '';
    String country = placemark.country ?? '';

    // Concatenate the address components
    String address = '$name, $street, $locality, $administrativeArea, $country';

    // Do something with the address
    print('Address: $address');
    // if (address != '') {
    //   address_name.value = address;
    // }

    return position;
  }

  var selectedImage = Rx<File?>(null);

  // Method to set the image
  void setImage(File image) async {
    print(address_name);


    // _determinePosition().then((value) {
    //   lat.value = '${value.latitude}';
    //   long.value = '${value.longitude}';
    // });

    selectedImage.value = image;
    print("Image have been set: ${selectedImage.value}");
    // print('latitude: $lat   Longitude: $long');
  }

  displayData() {
    print(
        "Asurer: ${asurer.value}, Name: ${nameController.value.text}, questionInfo: $questionionaire, Observation: ${observationController.value.text} ");
  }
}
