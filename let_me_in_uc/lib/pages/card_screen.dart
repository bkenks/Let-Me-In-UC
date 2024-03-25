//import 'dart:html';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_me_in_uc/util/AppColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardScreen extends StatefulWidget {

  final User? user;

  const CardScreen({super.key, required this.user});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  @override
  Widget build(BuildContext context) {
    
    // This is the working code
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("Person").doc(widget.user?.uid);
    Map<String, dynamic> userData = {};
    var email = "";

    // This is just a test to grab the data. I have no clue how to incorporate this into the UI
    docRef.get().then(
      (DocumentSnapshot doc) {
        userData = doc.data() as Map<String, dynamic>;

        print(userData['mNumber']);

      },
      onError: (e) => print("Error getting document: $e"),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColor.ucRed,
      ),
      drawer: Drawer(
        backgroundColor: AppColor.ucRed,
        child: Column(
          children: [
            const DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(color: AppColor.white),
              ),
            ),
            // This is where I'm trying to insert the MNumber
            // I can't get it to work though properly
            FutureBuilder<DocumentSnapshot>(
              future: docRef.get(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  
                  return const ListTile(
                      title: Text(
                      "Test",
                      style: const TextStyle(color: AppColor.white),
                    ),
                  );
                } else {
                  return ListTile(
                      title: Text(
                      snapshot.error.toString(),
                      style: TextStyle(color: AppColor.white),
                    )
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: AppColor.white,
              ),
              title: const Text(
                "Card Access",
                style: TextStyle(color: AppColor.white),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/card_access');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help_rounded,
                color: AppColor.white,
              ),
              title: const Text(
                "Help",
                style: TextStyle(color: AppColor.white),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/help_screen');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: AppColor.white,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(color: AppColor.white),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/main');
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width * 0.585,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('images/bearcatcard.png'),
                fit: BoxFit.contain),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 12,
                offset: Offset(0, 0),
                spreadRadius: -5,
              ),
            ]),
            //child: Text(MNumber),
      ),
    );
  }
}
