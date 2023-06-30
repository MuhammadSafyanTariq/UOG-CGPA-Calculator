import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AppBarWidget extends StatelessWidget {
  final bool backButton;
  final String title;
  const AppBarWidget({super.key, required this.title, this.backButton = true});

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors();

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: backButton,
      backgroundColor: myColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      toolbarHeight: height * 9,
    );
  }
}
