import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Branches extends StatelessWidget {
  const Branches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: primaryBgColor,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
              child: Text(
            "Branch Location!!!",
            style: themeData.textTheme.headline1,
          )),
        )));
  }
}
