import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen(),
    );
  }
}

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Your Profile"),
            backgroundColor: const Color.fromRGBO(210, 32, 46, 0.984),
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
          )),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Let Me In UC",
            style: TextStyle(
              color: const Color.fromRGBO(210, 32, 46, 0.984),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Don't Remember your Password?",
            style: TextStyle(color: const Color.fromRGBO(210, 32, 46, 0.984)),
          ),
          const SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color.fromRGBO(210, 32, 46, 0.984),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardScreen()));
              },
              child: const Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
