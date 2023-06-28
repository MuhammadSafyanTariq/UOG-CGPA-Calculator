import 'package:flutter/material.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/CGPA_calculator/CGPA_calculator.dart';
import 'package:notes_trove/Screens/time_table_screen/time_table_screen.dart';

import '../all_courses_screen/all_courses_screen.dart';
import 'Widgets/Home_button_stylish.dart';
import 'Widgets/home_button_simple.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';
  List<Course> courses = [
    Course(name: 'Mathematics', number: 'MATH101'),
    Course(name: 'Computer Science', number: 'CS201'),
    Course(name: 'English Literature', number: 'ENGL301'),
    Course(name: 'Object Oriented Programming', number: 'ENGL301'),
    Course(name: 'Programming Fundamentals', number: 'ENGL301'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      // backgroundColor: MyColors(context).primaryColor10,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 7,
              ),
              Text(
                'Notes\nTrove',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: height * 3.5 + width * 4),
              ),
              SizedBox(
                height: height * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeButtonStylish(
                    corner: true,
                    title: 'Courses',
                    icon: Icons.library_books,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseListScreen(courses: courses),
                        ),
                      );
                    },
                  ),
                  HomeButtonStylish(
                    title: 'CGPA\nCalculator',
                    icon: Icons.calculate,
                    corner: false,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CGPACalculatorScreen.routeName);
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 5),
              Column(
                children: [
                  HomeButtonSimple(
                    corner: false,
                    title: 'My Timetable',
                    icon: Icons.schedule,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        TimeTableScreen.routeName,
                        arguments: pdfUrl,
                      );
                    },
                  ),
                  // SizedBox(height: height * 3),
                  // HomeButtonSimple(
                  //   title: 'Progress Tracking',
                  //   icon: Icons.show_chart,
                  //   corner: true,
                  //   onPressed: () {
                  //     // Navigate to Progress Tracking screen
                  //   },
                  // ),
                  SizedBox(height: height * 3),
                  HomeButtonSimple(
                    corner: false,
                    title: 'Past Papers',
                    icon: Icons.description,
                    onPressed: () {
                      // Navigate to Past Paper screen
                    },
                  ),
                  SizedBox(height: height * 3),
                  HomeButtonSimple(
                    corner: false,
                    title: 'Reminders',
                    icon: Icons.notifications_active_outlined,
                    onPressed: () {
                      // Navigate to Past Paper screen
                    },
                  ),
                  SizedBox(height: height * 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
