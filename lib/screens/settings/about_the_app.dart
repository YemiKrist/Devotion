import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/constants/about.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class AboutTheApp extends StatefulWidget {
  const AboutTheApp({Key? key}) : super(key: key);

  @override
  State<AboutTheApp> createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    String about = AboutData.getAbout2();
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
      backgroundColor: bgGrey,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              const Text(
                "About CACSA App",
                textAlign: TextAlign.center,
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
      ),
    );
  }
}
