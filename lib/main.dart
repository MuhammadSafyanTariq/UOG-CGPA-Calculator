import 'package:flutter/material.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/QuizReminder/widgets/add_quiz_screen.dart';
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
      home: WelcomeScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
