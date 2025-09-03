import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/11.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/initial_page/fingerprint.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/initial_page/initialscreen.dart';
import 'package:food_delivery_app/initial_page/loadingscreen.dart';
import 'package:food_delivery_app/initial_page/login.dart';
import 'package:food_delivery_app/screen/orderconfirmed.dart';
import 'package:food_delivery_app/initial_page/resetpassword.dart';
import 'package:food_delivery_app/initial_page/signup.dart';
import 'package:food_delivery_app/initial_page/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
      home: const Loadingscreen(),
    );
  }
}
