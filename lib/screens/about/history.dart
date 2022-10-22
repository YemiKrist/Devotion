import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/constants/about.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    String about = AboutData.getAbout();
    return Scaffold(
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                addVerticalSpace(25),
                const Text(
                  'About CACSA',
                  style: TextStyle(
                      color: textColorGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Euclid-Medium'),
                ),
                addVerticalSpace(15),
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        about,
                        style: themeData.textTheme.bodyText1,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
