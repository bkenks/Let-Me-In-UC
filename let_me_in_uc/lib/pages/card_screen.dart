import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromRGBO(210, 32, 46, 1),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(210, 32, 46, 1),
        child: Column(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/help_page');
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
                color: Colors.red,
                blurRadius: 12,
                offset: Offset(0, 4),
                spreadRadius: -5,
              ),
            ]),
      ),
    );
  }
}
