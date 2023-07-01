import 'package:flutter/material.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/all_courses_screen/widgets/add_course_widget.dart';
import 'package:notes_trove/Screens/notes_screen/notes_screen.dart';
import 'package:notes_trove/utils/colors.dart';

import '../../Common/Widgets/app_bar.dart';

class CourseListScreen extends StatelessWidget {
  final List<Course> courses;

  CourseListScreen({super.key, required this.courses});
  List<Notes> notesList = [
    Notes(url: pdfUrl, name: 'pdf 1'),
    Notes(url: pdfUrl2, name: 'pdf 2'),
    Notes(url: pptUrl, name: 'ppt'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: AppBarWidget(title: 'My Courses'),
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
                  builder: (context) => CourseNotesScreen(
                    notes: notesList,
                    appbarTitle: course.name,
                  ),
                ),
              ),
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
      floatingActionButton: isItAdminMode
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddCourseScreen(),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: MyColors().primaryColor,
            )
          : null,
    );
  }
}

class Course {
  final String name;
  final String number;

  Course({required this.name, required this.number});
}
