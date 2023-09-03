import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';

import '../Common/global_variables.dart';

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
          context, CGPACalculatorScreen.routeName, (route) => false);
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
          height: 400,
        ),
      ),
    );
  }
}
