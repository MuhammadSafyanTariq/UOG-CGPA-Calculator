import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/Dialog.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/utils/colors.dart';

enum QuizAssignmentType {
  Quiz,
  Assignment,
}

class AddQuizAssignmentScreen extends StatefulWidget {
  static const routeName = 'add-quiz-screen';
  final List<String> courses;

  AddQuizAssignmentScreen({required this.courses});

  @override
  _AddQuizAssignmentScreenState createState() =>
      _AddQuizAssignmentScreenState();
}

class _AddQuizAssignmentScreenState extends State<AddQuizAssignmentScreen> {
  String selectedCourse = '';
  DateTime? selectedDate;
  QuizAssignmentType? selectedType;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<dynamic> submissions = [];

  @override
  void initState() {
    super.initState();
    if (widget.courses.isNotEmpty) {
      selectedCourse = widget.courses[0];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: AppBarWidget(title: 'Add Quiz/Assignment'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 3,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Quiz/Assignment title',
                ),
              ),
              SizedBox(height: height * 2),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 4,
              ),
              SizedBox(height: height * 2),
              DropdownButtonFormField<String>(
                value: selectedCourse,
                onChanged: (newValue) {
                  setState(() {
                    selectedCourse = newValue!;
                  });
                },
                items: widget.courses.map((course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Course Name',
                ),
              ),
              SizedBox(height: height * 2),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<QuizAssignmentType>(
                      title: Text('Quiz'),
                      value: QuizAssignmentType.Quiz,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<QuizAssignmentType>(
                      title: Text('Assignment'),
                      value: QuizAssignmentType.Assignment,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 2),
              TextButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[50]),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    setState(() {
                      this.selectedDate = selectedDate;
                    });
                  });
                },
                child: Text('Select Due Date'),
              ),
              SizedBox(height: height * 2),
              Text(
                'Due Date: ${selectedDate != null ? selectedDate.toString().split(' ')[0] : ''}',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors().primaryColor,
        onPressed: () {
          String name = _nameController.text;
          String description = _descriptionController.text;

          if (name.isEmpty ||
              description.isEmpty ||
              selectedCourse.isEmpty ||
              selectedDate == null ||
              selectedType == null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogBox(
                  text: 'Error!',
                  subtext: 'Please fill all Feilds',
                  color: MyColors().primaryColor,
                  icon: Icons.error_outline,
                );
              },
            );
            return; // Prevent further execution
          }

          List<dynamic> quizAssignment = [
            name,
            selectedCourse,
            selectedDate,
            selectedType.toString().split('.').last,
            description,
          ];

          submissions.add(quizAssignment);

          // Clear the form fields
          _nameController.clear();
          _descriptionController.clear();
          selectedCourse = widget.courses[0];
          selectedDate = null;
          selectedType = null;

          // Print the submissions list (for testing purposes)
          print(submissions);

          // Do something with the quiz/assignment data
          // ...

          // Navigator.pop(context); // Return to previous screen
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
