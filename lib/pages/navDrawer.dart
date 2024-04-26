// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sac/service/authService.dart';
import 'package:sac/service/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String? name, email, contact, address, assurer, carType, imatricule;
  getTheSharedPref() async {
    name = await SharedPrefrenceHelper().getUserName();
    email = await SharedPrefrenceHelper().getUserEmail();
    contact = await SharedPrefrenceHelper().getUserContact();
    address = await SharedPrefrenceHelper().getUserAddress();
    assurer = await SharedPrefrenceHelper().getAssureur();
    carType = await SharedPrefrenceHelper().getCarType();
    imatricule = await SharedPrefrenceHelper().getImatricule();
    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onTheLoad();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "$name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            accountEmail: Text(
              "$email",
              style: TextStyle(fontSize: 18),
            ),
            currentAccountPicture: CircleAvatar(
                child: Icon(
              Icons.person,
              size: 48,
            )),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage('assets/carOv1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "My Info",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Container(
              height: 1,
              width: width / 1.3,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          drawerItems(
            lable: "Name",
            text: "$name",
          ),
          SizedBox(height: 10),
          drawerItems(
            lable: "Email",
            text: "$email",
          ),
          SizedBox(height: 10),
          drawerItems(
            lable: "Contact",
            text: "$contact",
          ),
          SizedBox(height: 10),
          drawerItems(
            lable: "Address",
            text: "$address",
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Car Info",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Container(
              height: 1,
              width: width / 1.3,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          drawerItems(
            lable: "Assurer",
            text: "$assurer",
          ),
          SizedBox(height: 10),
          drawerItems(
            lable: "Veihcle Type",
            text: "$carType",
          ),
          SizedBox(height: 10),
          drawerItems(
            lable: "Imatricule",
            text: "$imatricule",
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                onPressed: () {
                  AuthService().signOutUser(context);
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class drawerItems extends StatelessWidget {
  drawerItems({
    required this.lable,
    required this.text,
    super.key,
  });

  String lable;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Text(
            lable,
            style: TextStyle(fontSize: 17),
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
