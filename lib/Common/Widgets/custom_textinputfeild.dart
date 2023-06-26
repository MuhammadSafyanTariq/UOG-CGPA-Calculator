import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextInputField extends StatelessWidget {
  final Function(String)? onSubmitted;
  final BuildContext context;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;

  const TextInputField({
    Key? key,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    required this.context,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColors myColors = MyColors(context);

    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return SizedBox(
      height: height * 7,
      width: width * 90,
      child: TextField(
        onSubmitted: onSubmitted,
        scribbleEnabled: false,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: myColors.greyColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black26,
          ),
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
