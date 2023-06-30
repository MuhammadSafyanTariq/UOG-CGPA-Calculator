import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/logo_widget.dart';
import 'package:notes_trove/Screens/auth_screens/reset_password_screen.dart';

import '../../Common/Widgets/custom_button.dart';
import '../../Common/Widgets/custom_textinputfeild.dart';

class PasswordCreationScreen extends StatefulWidget {
  static const String routeName = '/password-creation-screen';

  const PasswordCreationScreen({super.key});

  @override
  _PasswordCreationScreenState createState() => _PasswordCreationScreenState();
}

class _PasswordCreationScreenState extends State<PasswordCreationScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 20,
              ),
              const LogoWidget(),
              SizedBox(height: height * 5),
              Text(
                'Password Creation',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 3,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Create new password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 30.0),
              TextInputField(
                obscureText: true,
                context: context,
                icon: Icons.lock_outline,
                hintText: 'Password',
              ),
              SizedBox(height: height * 2),
              TextInputField(
                obscureText: true,
                context: context,
                icon: Icons.lock_outline,
                hintText: 'Confirm Password',
              ),
              SizedBox(height: height * 4),
              CustomButton(
                context: context,
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
