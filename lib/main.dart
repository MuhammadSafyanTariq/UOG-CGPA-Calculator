import 'package:flutter/material.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';
import 'package:notes_trove/Screens/home_screen/home_screen.dart';
import 'package:notes_trove/Screens/time_table_screen/time_table_screen.dart';
import 'package:notes_trove/routes/routes.dart';
import 'package:notes_trove/utils/colors.dart';

import 'Screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyColors(context).primarySwatch,
      ),
      home: WelcomeScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
