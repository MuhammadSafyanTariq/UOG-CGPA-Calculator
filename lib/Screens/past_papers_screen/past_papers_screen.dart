import 'package:flutter/material.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/past_papers_screen/Widgets/past_papers_list.dart';

import '../../Common/Widgets/app_bar.dart';
import '../all_courses_screen/all_courses_screen.dart';

class PastPapersScreen extends StatelessWidget {
  static const String routeName = 'past-papers-screen';

  final List<Course> courses;

  PastPapersScreen({super.key, required this.courses});
  List<Papers> papersList = [
    Papers(url: pdfUrl, name: 'Fall-21'),
    Papers(url: pdfUrl2, name: 'Fall-21'),
    Papers(url: pptUrl, name: 'Spring-20'),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: const AppBarWidget(title: 'Past Papers'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 4),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            Course course = courses[index];
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PastPapers(notes: papersList, appbarTitle: course.name),
                  )),
              child: Column(
                children: [
                  ListTile(
                    title: Text(course.name),
                    subtitle: Text('Course Number: ${course.number}'),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black26,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
