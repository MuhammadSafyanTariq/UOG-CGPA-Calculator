import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/logo_widget.dart';
import 'package:notes_trove/Common/global_variables.dart';

import '../../Common/Widgets/custom_button.dart';
import '../../Common/Widgets/custom_textinputfeild.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset-password-screen';

  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
              LogoWidget(),
              SizedBox(height: height * 5),
              Text(
                'Reset Password',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 3,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Enter the email address or mobile phone number\nassociated with your BookProsly account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 30.0),
              TextInputField(
                context: context,
                hintText: '8+ Character',
              ),
              SizedBox(height: height * 2),
              TextInputField(
                context: context,
                icon: Icons.lock_outline,
                hintText: 'Confirm Password',
              ),
              SizedBox(height: height * 4),
              CustomButton(
                context: context,
                text: 'Reset Password',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
