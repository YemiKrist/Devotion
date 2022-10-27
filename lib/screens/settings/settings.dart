import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: SafeArea(
          child: Container(
        // padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyAppBar(),
            Text("Settings"),
            Text("About CACSA App"),
            Text("Subscribe (Premium Access)"),
            Text("Contact Support"),
            Text("Check for Update"),
            Text("Log Out")
          ],
        ),
      )),
    );
  }
}
