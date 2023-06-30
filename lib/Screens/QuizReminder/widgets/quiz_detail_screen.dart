import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';

class QuizAssignmentDetail {
  final String title;
  final DateTime date;
  final String type;
  final String courseName;
  final String description;

  QuizAssignmentDetail({
    required this.title,
    required this.date,
    required this.type,
    required this.courseName,
    required this.description,
  });
}

class QuizAssignmentDetailsScreen extends StatelessWidget {
  static const String routeName = 'quiz-asg-screen';
  final QuizAssignmentDetail quizAssignment;

  const QuizAssignmentDetailsScreen({super.key, required this.quizAssignment});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          height * 9,
        ),
        child: AppBarWidget(title: quizAssignment.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Course:      ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: quizAssignment.courseName,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 2,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Due Date:   ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: DateFormat('yyyy-MM-dd').format(quizAssignment.date),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 4),
            const Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: height * 2),
            Text(
              quizAssignment.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
