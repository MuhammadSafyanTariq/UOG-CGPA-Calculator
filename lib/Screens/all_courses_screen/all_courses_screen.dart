import 'package:flutter/material.dart';
import 'package:notes_trove/utils/colors.dart';

import '../../Common/Widgets/app_bar.dart';

class CourseListScreen extends StatelessWidget {
  final List<Course> courses;

  CourseListScreen({required this.courses});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(title: 'My Courses'),
        preferredSize: Size(double.infinity, height * 9),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 4),
        child: InkWell(
          child: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              Course course = courses[index];
              return Column(
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class Course {
  final String name;
  final String number;

  Course({required this.name, required this.number});
}
