import 'package:flutter/material.dart';
import 'package:notes_trove/utils/colors.dart';

class HomeButtonStylish extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool corner;
  final VoidCallback onPressed;

  const HomeButtonStylish({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.corner,
  });

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors(context);

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Container(
      width: width * 41,
      height: height * 18 + 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(corner ? 0.0 : 40),
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(corner ? 40 : 0),
          bottomLeft: Radius.circular(40),
        ),
        color: myColors.primaryColor,
        // gradient:
        //     corner ? MyColors.primaryGradient1 : MyColors.primaryGradient2,
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(corner ? 0.0 : 40),
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(corner ? 0.0 : 40),
            bottomLeft: Radius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48.0,
                  color: Colors.white,
                ),
                SizedBox(height: 12.0),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
