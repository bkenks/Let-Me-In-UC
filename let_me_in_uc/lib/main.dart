import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:let_me_in_uc/firebase_options.dart';
import 'package:let_me_in_uc/pages/card_access.dart';
import 'package:let_me_in_uc/pages/card_screen.dart';
import 'package:let_me_in_uc/pages/help_screen.dart';
import 'package:let_me_in_uc/util/AppColor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/main': (context) => const MainApp(),
        '/card_access': (context) => const CardAccess(),
        '/help_screen': (context) => const HelpScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Init firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const LoginScreen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//Login function

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    //Textfield controller
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/logolock.png'),
            width: 100,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Let Me In",
            style: TextStyle(
              color: AppColor.ucRed,
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            "University of Cincinnati",
            style: TextStyle(
              color: AppColor.ucRed,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          TextField(
            style: const TextStyle(color: AppColor.ucRed),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.ucRed),
              ),
              hintText: "Email",
              prefixIcon: Icon(Icons.mail, color: AppColor.ucRed),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            style: const TextStyle(color: AppColor.ucRed),
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.ucRed),
              ),
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: AppColor.ucRed),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Don't Remember your Password?",
            style: TextStyle(color: AppColor.ucRed),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: AppColor.ucRed,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context);
                if (user != null) {
                  print(user.email);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CardScreen(user: user)));

                  // Uncomment to use alternate push. Need to add screen alias in main function first
                  // if (!mounted) return;
                  // Navigator.pushReplacementNamed(context, '/card_screen');
                }
              },
              child: const Text("Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
