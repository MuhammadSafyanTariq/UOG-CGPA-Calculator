import 'package:flutter/material.dart';

import 'custom_button.dart';

class DialogBox extends StatelessWidget {
  final String text;
  final String subtext;
  final IconData icon;
  final Color color;

  DialogBox(
      {required this.text,
      required this.subtext,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: width * 80,
        height: width * 70,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            SizedBox(
              height: height * 1.5,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: width * 3,
            ),
            Text(
              subtext,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF908F82),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: width * 5,
            ),
            CustomButton(
              text: 'Okay',
              onPressed: () {
                Navigator.pop(context);
              },
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
