import 'package:flutter/material.dart';
import 'package:notes_trove/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BuildContext context;
  final bool haveIcon;
  final IconData icon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.context,
    this.haveIcon = false,
    this.icon = Icons.person_outline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors();
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: myColors.primaryColor,
        fixedSize: Size(width * 90, height * 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (haveIcon)
              Icon(
                icon,
                size: 18,
                color: Colors.white,
              ),
            if (haveIcon)
              SizedBox(
                width: width * 2,
              ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
