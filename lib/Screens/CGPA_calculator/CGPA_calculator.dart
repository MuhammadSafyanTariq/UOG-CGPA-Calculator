import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_trove/Common/Widgets/Dialog.dart';
import 'package:notes_trove/Common/Widgets/custom_button.dart';
import 'package:notes_trove/utils/colors.dart';

class CGPACalculatorScreen extends StatefulWidget {
  static const routeName = 'cgpa-clc-screen';

  const CGPACalculatorScreen({super.key});
  @override
  _CGPACalculatorScreenState createState() => _CGPACalculatorScreenState();
}

class _CGPACalculatorScreenState extends State<CGPACalculatorScreen> {
  int numOfCourses = 0;
  List<String> grades = [];
  List<int> creditHours = [];
  double previousCGPA = 0.0;
  int totalCreditHours = 0;
  double calculatedCGPA = 0.0;
  double calculatedCGPARounded = 0.0;

  void shareApp() {
    // Share.share('Check out this awesome app! https://example.com');
  }

  List<String> gradeOptions = [
    'A+ (84.5 or more)',
    'A (79.5 or more)',
    'B+ (74.5 or more)',
    'B (69.5 or more)',
    'B- (64.5 or more)',
    'C+ (59.5 or more)',
    'C (54.5 or more)',
    'D (49.5 or more)',
    'F',
  ];

  Map<String, double> gradeValues = {
    'A+ (84.5 or more)': 4.00,
    'A (79.5 or more)': 3.70,
    'B+ (74.5 or more)': 3.40,
    'B (69.5 or more)': 3.00,
    'B- (64.5 or more)': 2.50,
    'C+ (59.5 or more)': 2.00,
    'C (54.5 or more)': 1.50,
    'D (49.5 or more)': 1.00,
    'F': 0.00,
  };

  @override
  Widget build(BuildContext context) {
    print('------------------------&{}');
    MyColors myColors = MyColors();

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'UOG CGPA Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle the selected option here
              if (value == 'share') {
                // Add code to share your app here
                shareApp();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'share',
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share App'),
                  ),
                ),
                // Add more options as needed
              ];
            },
          ),
        ],
        toolbarHeight: height * 9,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: height * 2,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  numOfCourses = int.parse(value);
                  grades = List<String>.filled(numOfCourses, gradeOptions[0]);
                  creditHours = List<int>.filled(numOfCourses, 0);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Number of Courses',
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: numOfCourses,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  margin: EdgeInsets.only(bottom: height),
                  decoration: BoxDecoration(
                      color: myColors.primaryColor10,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: grades[index],
                          items: gradeOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              grades[index] = value ?? '';
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Grade',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              creditHours[index] = int.parse(value);
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Credit Hours',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  previousCGPA = double.parse(value);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Previous CGPA',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalCreditHours = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Total Credit Hours',
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Calculate CGPA',
              onPressed: () {
                calculateCGPA();

                showDialog(
                  context: context,
                  builder: (context) => DialogBox(
                    color: Colors.black,
                    icon: FontAwesomeIcons.faceSmile,
                    text: 'Your CGPA is',
                    subtext: '${calculatedCGPA.toStringAsFixed(4)}',
                  ),
                );
              },
              context: context,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void calculateCGPA() {
    double totalGradePoints = 0.0;
    int totalCredits = 0;

    for (int i = 0; i < numOfCourses; i++) {
      double gradePoint = gradeValues[grades[i]]!;
      int credit = creditHours[i];
      totalGradePoints += gradePoint * credit;
      totalCredits += credit;
    }

    double previousGradePoints = previousCGPA * totalCreditHours;
    double totalGradePointsWithPrevious =
        totalGradePoints + previousGradePoints;
    int totalCreditsWithPrevious = totalCredits + totalCreditHours;

    calculatedCGPA = totalGradePointsWithPrevious / totalCreditsWithPrevious;

    setState(() {});
  }
}
