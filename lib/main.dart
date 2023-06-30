import 'package:flutter/material.dart';
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
        primarySwatch: MyColors().primarySwatch,
      ),
      home: const WelcomeScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
