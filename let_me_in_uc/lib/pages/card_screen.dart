import 'package:flutter/material.dart';
import 'package:let_me_in_uc/util/AppColor.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
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
                color: AppColor.ucRed,
                blurRadius: 12,
                offset: Offset(0, 4),
                spreadRadius: -5,
              ),
            ]),
      ),
    );
  }
}
