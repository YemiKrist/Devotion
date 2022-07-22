import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Manuals extends StatelessWidget {
  const Manuals({Key? key}) : super(key: key);

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
            "CACSA MANUALS!!!",
            style: themeData.textTheme.headline1,
          )),
        )));
  }
}
