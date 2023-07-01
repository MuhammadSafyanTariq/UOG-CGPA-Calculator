import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/Common/Widgets/web_view_screen.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/Screens/notes_screen/widgets/single_note.dart';
import 'package:notes_trove/utils/colors.dart';

class CourseNotesScreen extends StatefulWidget {
  static const String routeName = 'course-notes-screen';
  final String appbarTitle;
  final List<Notes> notes;

  const CourseNotesScreen({
    Key? key,
    required this.notes,
    required this.appbarTitle,
  }) : super(key: key);

  @override
  _CourseNotesScreenState createState() => _CourseNotesScreenState();
}

class _CourseNotesScreenState extends State<CourseNotesScreen> {
  List<UploadedDocument> uploadedDocuments = [];

  Future<void> _uploadDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      List<String> selectedFiles =
          result.files.map((file) => file.path!).toList();

      for (String filePath in selectedFiles) {
        uploadedDocuments.add(
          UploadedDocument(
            courseName: widget.appbarTitle,
            documentPath: filePath,
          ),
        );
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: AppBarWidget(
          title: widget.appbarTitle,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final notes = widget.notes[index];
          return SingleNoteCard(title: notes.name, url: notes.url);
        },
      ),
      floatingActionButton: isItAdminMode
          ? FloatingActionButton(
              onPressed: _uploadDocuments,
              child: Icon(Icons.upload),
              backgroundColor: MyColors().primaryColor,
            )
          : null,
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

class UploadedDocument {
  String courseName;
  String documentPath;

  UploadedDocument({
    required this.courseName,
    required this.documentPath,
  });
}
