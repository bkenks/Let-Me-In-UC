import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("Person").doc(widget.user?.uid);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.ucRed,
        foregroundColor: AppColor.white,
      ),
      drawer: Drawer(
        backgroundColor: AppColor.ucRed,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Let Me In UC",
                  style: TextStyle(
                      color: AppColor.ucRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: docRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  String mNumber = userData['mNumber'];
                  String fullName =
                      userData['firstName'] + " " + userData['lastName'];

                  return ListTile(
                    title: Text(
                      "$fullName - $mNumber",
                      style: const TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return const ListTile(
                      title: Text(
                    "Error",
                    style: TextStyle(color: AppColor.white),
                  ));
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
