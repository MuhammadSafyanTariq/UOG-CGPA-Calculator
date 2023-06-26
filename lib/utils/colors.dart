import 'package:flutter/material.dart';

class MyColors {
  final BuildContext context;

  MyColors(this.context);

  Color get primaryColor => Color.fromRGBO(0, 68, 109, 1);
  Color get primaryColor2 => Color.fromRGBO(47, 196, 226, 1);
  Color get primaryColor210 => Color.fromRGBO(47, 196, 226, 0.1);
  Color get primaryColor10 => Color.fromRGBO(0, 68, 109, 0.1);
  Color get redColor => Color.fromRGBO(252, 68, 68, 1.0);
  Color get greyColor => Color(0xFFF6F6F7);

  MaterialColor get primarySwatch {
    final primaryColorValue = Color.fromRGBO(0, 68, 109, 1);
    return MaterialColor(primaryColorValue.value, <int, Color>{
      50: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.1),
      100: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.2),
      200: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.3),
      300: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.4),
      400: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.5),
      500: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.6),
      600: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.7),
      700: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.8),
      800: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 0.9),
      900: Color.fromRGBO(primaryColorValue.red, primaryColorValue.green,
          primaryColorValue.blue, 1.0),
    });
  }
}

// class MyColorsWidget extends StatelessWidget {
//   final MyColors myColors;

//   MyColorsWidget({required BuildContext context})
//       : myColors = MyColors(context);

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// bool isDarkMode(BuildContext context) {
//   final theme = Theme.of(context);
//   return theme.brightness == Brightness.dark;
// }