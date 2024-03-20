import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:let_me_in_uc/util/AppColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  //////////    Just ignore this temporarliy   //////////
  // Future<String> getMNum () async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   final userRef = db.collection("Person").doc("1kmRfFeYg3aKzAxwQxVb");
  //   final userDoc = await userRef.get();
  //   final userData = userDoc.data();

  //   return userData!['email'];
  // }
  //////////    End   //////////

  @override
  Widget build(BuildContext context) {
    
    // This is the working code
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("Person").doc("1kmRfFeYg3aKzAxwQxVb");
    var data;
    var email;
    docRef.get().then(
      (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;

        // When calling the 'email' variable, it causes the error I was talking about. The print statement works though
        email = data['email'];
        print(data['email']);

      },
      onError: (e) => print("Error getting document: $e"),
    );
    

    //////////  Code for accessing database through the current user  //////////
    // Future<DocumentSnapshot> getUserInfo()async{
    //   var firebaseUser = await FirebaseAuth.instance.currentUser();
    //   return await FirebaseFirestore.instance.collection("users").document(firebaseUser.uid).get();
    // }

    // FutureBuilder(
    //         future: getUserInfo(),
    //         builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //           if (snapshot.connectionState == ConnectionState.done) {
    //             return ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: 1,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return ListTile(
    //                     title:
    //                         Text(snapshot.data.data["email"]),
    //                   );
    //                 });
    //           } else if (snapshot.connectionState == ConnectionState.none) {
    //             return Text("No data");
    //           }
    //           return CircularProgressIndicator();
    //         },
    //   ),
    //////////    End    //////////

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
            ListTile(
              title: Text(
                email,
                style: const TextStyle(color: AppColor.white),
              ),
              onTap: () {},
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
