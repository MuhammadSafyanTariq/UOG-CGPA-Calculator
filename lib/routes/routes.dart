import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/web_view_screen.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';
import 'package:notes_trove/Screens/QuizReminder/reminder_screen.dart';
import 'package:notes_trove/Screens/QuizReminder/widgets/quiz_detail_screen.dart';
import 'package:notes_trove/Screens/all_courses_screen/all_courses_screen.dart';
import 'package:notes_trove/Screens/bottom_nav_bar.dart';
import 'package:notes_trove/Screens/home_screen/home_screen.dart';
import 'package:notes_trove/Screens/notes_screen/notes_screen.dart';
import 'package:notes_trove/Screens/past_papers_screen/past_papers_screen.dart';
import 'package:notes_trove/Screens/time_table_screen/time_table_screen.dart';

import '../Screens/QuizReminder/widgets/add_quiz_screen.dart';
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
    case BottomNavBarScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BottomNavBarScreen(),
      );
    case TimeTableScreen.routeName:
      var pdfUrl = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TimeTableScreen(pdfUrl: pdfUrl),
      );
    case WebViewScreen.routeName:
      var url = routeSettings.arguments as String;
      var title = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WebViewScreen(url: url, title: title),
      );
    case CourseNotesScreen.routeName:
      var notes = routeSettings.arguments as List<Notes>;
      String appbarTitle = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CourseNotesScreen(
          notes: notes,
          appbarTitle: appbarTitle,
        ),
      );
    case PastPapersScreen.routeName:
      var courses = routeSettings.arguments as List<Course>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PastPapersScreen(
          courses: courses,
        ),
      );
    case QuizAssignmentDetailsScreen.routeName:
      var quizAssignment = routeSettings.arguments as QuizAssignmentDetail;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => QuizAssignmentDetailsScreen(
          quizAssignment: quizAssignment,
        ),
      );

    case QuizAssignmentScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => QuizAssignmentScreen(),
      );
    case AddQuizAssignmentScreen.routeName:
      var courseList = routeSettings.arguments as List<String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddQuizAssignmentScreen(
          courses: courseList,
        ),
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
