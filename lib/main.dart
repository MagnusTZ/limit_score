import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:limit_score/screens/home_screen.dart';
import 'package:limit_score/screens/login_screen.dart';
import 'package:limit_score/screens/registration_screen.dart';
import 'package:limit_score/screens/welcome_screen.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(LimitScore());
}

class LimitScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
