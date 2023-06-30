import 'dart:async';

import 'package:flutter/material.dart';

import '../Common/global_variables.dart';
import 'auth_screens/sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome-screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, SignInScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          appLogo,
          fit: BoxFit.contain,
          height: 200,
        ),
      ),
    );
  }
}
