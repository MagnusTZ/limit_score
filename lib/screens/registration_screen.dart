import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limit_score/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/Illustration3.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/Illustration4.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Icon(
                      Icons.credit_score_outlined,
                      size: 200.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x8c281B5A),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Register',
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  speed: const Duration(milliseconds: 200),
                                ),
                              ],
                              totalRepeatCount: 1,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your email'),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your password'),
                          ),
                          // SizedBox(
                          //   height: 16.0,
                          // ),
                          RoundedButton(
                            title: 'Register',
                            color: Colors.black,
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                                Navigator.pushNamed(context, HomeScreen.id);

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
