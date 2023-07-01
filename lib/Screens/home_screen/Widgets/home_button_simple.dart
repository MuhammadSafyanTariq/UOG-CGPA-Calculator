import 'package:flutter/material.dart';
import 'package:notes_trove/utils/colors.dart';

class HomeButtonSimple extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool corner;
  final VoidCallback onPressed;

  const HomeButtonSimple({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.corner,
  });

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors();

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Container(
      height: height * 11.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 4.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width * 3),
                Icon(
                  icon,
                  size: 48.0,
                  color: MyColors().primaryColor,
                ),
                SizedBox(width: width * 5),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: MyColors().primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
