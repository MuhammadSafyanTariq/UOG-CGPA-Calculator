import 'package:flutter/material.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';
import 'package:notes_trove/Screens/home_screen/home_screen.dart';
import 'package:notes_trove/Screens/time_table_screen/time_table_screen.dart';

import '../Screens/auth_screens/forget_password_screen.dart';
import '../Screens/auth_screens/password_creation_screen.dart';
import '../Screens/auth_screens/reset_password_screen.dart';
import '../Screens/auth_screens/sign_in_screen.dart';
import '../Screens/auth_screens/sign_up_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ForgetPasswordScreen(),
      );
    case PasswordCreationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PasswordCreationScreen(),
      );
    case ResetPasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ResetPasswordScreen(),
      );
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );

    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case CGPACalculatorScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CGPACalculatorScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case TimeTableScreen.routeName:
      var pdfUrl = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TimeTableScreen(pdfUrl: pdfUrl),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('This page does not exist...'),
          ),
        ),
      );
  }
}
