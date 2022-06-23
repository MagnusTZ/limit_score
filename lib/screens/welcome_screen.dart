import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:limit_score/components/rounded_button.dart';

import '../constants.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         Color(0xffAE41A5),
          //         Color(0xff31247E),
          //       ],
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 265.0,
              //width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                color: Color(0xff1C162E),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/images/image2.png'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 50.0,
                  right: 55.0,
                  bottom: 15.0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Hero(
                  //     tag: 'logo',
                  //     child: Icon(
                  //       Icons.credit_score_outlined,
                  //       color: Color(0xff1AD5AD),
                  //       size: 60.0,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 38.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Limit Score',
                            textStyle: const TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff1AD5AD),
                            ),
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                    ),
                  ),
                ],
              ),
              // const Expanded(
              //   child: Image(
              //     image: AssetImage('assets/images/image2.png'),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              const SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 550.0,
                  bottom: 60.0,
                ),
                child: RoundedButton(
                  title: 'Get Started',
                  color: kButtonColor1,
                  width: 140.0,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 16.0,
              //     right: 16.0,
              //   ),
              //   child: RoundedButton(
              //     title: 'Register',
              //     color: kButtonColor1,
              //     width: 136.0,
              //     onPressed: () {
              //       Navigator.pushNamed(context, RegistrationScreen.id);
              //     },
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
