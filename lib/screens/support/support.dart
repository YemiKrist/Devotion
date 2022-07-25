import 'package:cacsa/commons/button.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
              child: AppButtons(
            backgroundColor: primaryBgColor,
            text: 'Support Page',
            textColor: Colors.white,
            borderColor: Colors.transparent,
            onTap: (() {}),
          )
              // Text(
              // "Support Page!!!",
              // style: themeData.textTheme.headline1,
              // )
              ),
        )));
  }
}
