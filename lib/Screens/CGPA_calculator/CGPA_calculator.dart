import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/Dialog.dart';
import 'package:notes_trove/Common/Widgets/custom_button.dart';
import 'package:notes_trove/utils/colors.dart';

class CGPACalculatorScreen extends StatefulWidget {
  static const routeName = 'cgpa-clc-screen';
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

  List<String> gradeOptions = [
    'A+',
    'A',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'D',
    'F',
  ];

  Map<String, double> gradeValues = {
    'A+': 4.00,
    'A': 3.70,
    'B+': 3.40,
    'B': 3.00,
    'B-': 2.50,
    'C+': 2.00,
    'C': 1.50,
    'D': 1.00,
    'F': 0.00,
  };

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors(context);

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        elevation: 0,
        title: Text(
          'CGPA Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
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
              decoration: InputDecoration(
                labelText: 'Number of Courses',
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: numOfCourses,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                          decoration: InputDecoration(
                            labelText: 'Grade',
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              creditHours[index] = int.parse(value);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Credit Hours',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  previousCGPA = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Previous CGPA',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalCreditHours = int.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Total Credit Hours',
              ),
            ),
            SizedBox(height: 16.0),
            CustomButton(
              text: 'Calculate CGPA',
              onPressed: () {
                if (creditHours.contains(0)) {
                  showDialog(
                    context: context,
                    builder: (context) => DialogBox(
                      text: 'Something is missing!',
                      subtext: "Please enter the credit hours for all courses",
                    ),
                  );
                } else {
                  calculateCGPA();

                  showDialog(
                    context: context,
                    builder: (context) => DialogBox(
                      text: 'Your CGPA is',
                      subtext: '$calculatedCGPA',
                    ),
                  );
                }
              },
              context: context,
            ),
            SizedBox(height: 16.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Calculated CGPA :    ',
            //       style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            //       textAlign: TextAlign.center,
            //     ),
            //     Text(
            //       '$calculatedCGPA',
            //       style: TextStyle(fontSize: 18.0),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),
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
