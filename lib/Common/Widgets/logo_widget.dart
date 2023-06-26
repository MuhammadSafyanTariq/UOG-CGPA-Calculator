import 'package:flutter/material.dart';

import '../global_variables.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Image.asset(
      appLogo,
      height: height * 15,
    );
  }
}
