import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/QuizReminder/widgets/quiz_detail_screen.dart';

import '../../utils/colors.dart';

class QuizAssignment {
  final String title;
  final DateTime date;
  final String type;
  final String courseName;
  final String description;

  QuizAssignment({
    required this.title,
    required this.date,
    required this.type,
    required this.courseName,
    required this.description,
  });
}

class QuizAssignmentScreen extends StatelessWidget {
  static const routeName = 'quiz-screen';
  final List<QuizAssignment> quizzesAssignments = [
    QuizAssignment(
      description: '        Quiz one description is that $dummytext',
      title: 'Quiz 1',
      date: DateTime(2023, 6, 24),
      type: 'Quiz',
      courseName: 'Mathematics',
    ),
    QuizAssignment(
      description: '        Quiz two description is that $dummytext',
      title: 'Assignment 1',
      date: DateTime(2023, 6, 25),
      type: 'Assignment',
      courseName: 'Science',
    ),
    // Add more quizzes and assignments here
  ];

  QuizAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    // Sort the list by date
    quizzesAssignments.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: const AppBarWidget(title: 'Assignments and Quizzes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: quizzesAssignments.length,
          itemBuilder: (context, index) {
            final quizAssignment = quizzesAssignments[index];
            return InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                QuizAssignmentDetailsScreen.routeName,
                arguments: QuizAssignmentDetail(
                  title: quizAssignment.title,
                  date: quizAssignment.date,
                  type: quizAssignment.type,
                  courseName: quizAssignment.courseName,
                  description: quizAssignment.description,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                margin: EdgeInsets.only(bottom: height),
                decoration: BoxDecoration(
                  color: MyColors().primaryColor10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    quizAssignment.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height,
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: 'Course: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: quizAssignment.courseName,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 2,
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: 'Due Date: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: DateFormat('yyyy-MM-dd')
                                  .format(quizAssignment.date),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: quizAssignment.type == 'Quiz'
                          ? Colors.blue
                          : Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      quizAssignment.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
