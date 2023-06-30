import 'package:flutter/material.dart';
import 'dart:math';

import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/utils/colors.dart';

import 'Widget/progress_indicator.dart';

class StudyProgressScreen extends StatefulWidget {
  const StudyProgressScreen({super.key});

  @override
  _StudyProgressScreenState createState() => _StudyProgressScreenState();
}

class _StudyProgressScreenState extends State<StudyProgressScreen> {
  final List<String> courses = [
    'Mathematics',
    'Sciense',
    'History',
    'Geography',
  ];
  List<double> dailyProgress = [
    1,
    2,
    3,
    4,
    // 1,
    // 0,
    // 4,
    // 4,
  ]; // Dummy data for daily progress hours
  List<double> weeklyProgress = [
    7.0,
    14.0,
    21.0,
    28.0,
    // 7.0,
    // 14.0,
    // 21.0,
    // 28.0,
  ]; // Dummy data for weekly progress hours
  List<double> monthlyProgress = [
    30.0,
    60.0,
    90.0,
    120.0,
    // 30.0,
    // 60.0,
    // 90.0,
    // 120.0,
  ]; // Dummy data for monthly progress hours
  int selectedOptionIndex = 0; // 0: Monthly, 1: Weekly, 2: Daily
  List<Color> subjectColors = [];

  @override
  void initState() {
    super.initState();
    assignSubjectColors();
  }

  void assignSubjectColors() {
    final random = Random();
    for (int i = 0; i < courses.length; i++) {
      subjectColors.add(Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: const AppBarWidget(
          title: 'My Study Progress',
          backButton: false,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: height * 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: MyColors().primaryColor,
                width: 1.0,
              ),
            ),
            child: DropdownButton<int>(
              iconEnabledColor: MyColors().primaryColor,
              elevation: 0,
              underline: Container(),
              borderRadius: BorderRadius.circular(10),
              value: selectedOptionIndex,
              onChanged: (value) {
                setState(() {
                  selectedOptionIndex = value!;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Monthly',
                    style: TextStyle(
                      color: MyColors().primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      color: MyColors().primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      color: MyColors().primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 5),
          Expanded(
            child: Stack(
              children: [
                CustomPaint(
                  painter: ProgressPainter(
                    progressValues: _getSelectedProgressValues(),
                    subjectColors: subjectColors,
                  ),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Total Hours',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getCombinedProgressHours().toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border:
                  Border.all(color: MyColors().primaryColor, strokeAlign: 1),
            ),
            child: SizedBox(
              height: courses.length < 7
                  ? height * (courses.length * 5.7)
                  : height * 35,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      for (int i = 0; i < courses.length; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height + 2),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: subjectColors[i],
                              ),
                              SizedBox(width: width * 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 60,
                                    child: Text(
                                      courses[i],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${_getSubjectHours(i).toStringAsFixed(1)} hours',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<double> _getSelectedProgressValues() {
    if (selectedOptionIndex == 0) {
      return monthlyProgress;
    } else if (selectedOptionIndex == 1) {
      return weeklyProgress;
    } else {
      return dailyProgress;
    }
  }

  double _getCombinedProgressHours() {
    double totalHours = 0;

    List<double> progressValues = _getSelectedProgressValues();

    for (int i = 0; i < progressValues.length; i++) {
      totalHours += progressValues[i];
    }

    return totalHours;
  }

  double _getSubjectHours(int index) {
    List<double> progressValues = _getSelectedProgressValues();

    return progressValues[index];
  }
}
