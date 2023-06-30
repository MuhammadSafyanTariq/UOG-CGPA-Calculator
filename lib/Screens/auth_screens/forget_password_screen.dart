import 'package:flutter/material.dart';
import 'package:notes_trove/Screens/auth_screens/password_creation_screen.dart';

import '../../Common/Widgets/custom_button.dart';
import '../../Common/Widgets/custom_textinputfeild.dart';
import '../../Common/Widgets/logo_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/forget-screen';

  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                'Forget Password',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 3,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Enter your Roll Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 30.0),
              TextInputField(
                context: context,
                icon: Icons.person,
                hintText: 'Roll Number',
              ),
              SizedBox(height: height * 4),
              CustomButton(
                context: context,
                text: 'Send Code',
                onPressed: () {
                  Navigator.pushNamed(
                      context, PasswordCreationScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
