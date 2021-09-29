import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:limit_score/components/rounded_button.dart';
import 'package:limit_score/screens/registration_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.orangeAccent,
    ).animate(controller);
    controller.forward();
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: animation.value,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image(
              image: AssetImage('assets/images/Illustration1.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Hero(
                          tag: 'logo',
                          child: Icon(
                            Icons.credit_score_outlined,
                            size: 60.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Limit Score',
                              textStyle: const TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'Register',
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
