import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limit_score/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kScreenBackgroundColor,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
            children: [
              // const SizedBox(
              //   height: double.infinity,
              //   width: double.infinity,
              //   child: Image(
              //     image: AssetImage('assets/images/Illustration2.png'),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Hero(
                    //   tag: 'logo',
                    //   child: Icon(
                    //     Icons.credit_score_outlined,
                    //     size: 200.0,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Email',
                          fillColor: const Color(0xff140F26),
                          filled: true),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Password',
                          fillColor: const Color(0xff140F26),
                          filled: true),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      title: 'Login',
                      color: kButtonColor1,
                      width: 136.0,
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          Navigator.pushNamed(context, HomeScreen.id);

                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          //print(e);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
