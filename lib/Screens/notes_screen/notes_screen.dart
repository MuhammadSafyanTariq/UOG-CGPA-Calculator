import 'package:flutter/material.dart';

import 'package:notes_trove/Common/Widgets/web_view_screen.dart';

class CourseNotesScreen extends StatefulWidget {
  static const String routeName = 'course-notes-screen';
  final List<Notes> notes;

  CourseNotesScreen({key, required this.notes}) : super(key: key);

  @override
  _CourseNotesScreenState createState() => _CourseNotesScreenState();
}

class _CourseNotesScreenState extends State<CourseNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
      ),
      body: ListView.builder(
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final notes = widget.notes[index];
          return ListTile(
            title: Text(notes.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                    url: notes.url,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Notes {
  String url;
  String name;
  Notes({
    required this.url,
    required this.name,
  });
}
