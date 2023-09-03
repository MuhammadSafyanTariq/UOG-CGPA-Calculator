import 'package:flutter/material.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case CGPACalculatorScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CGPACalculatorScreen(),
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
