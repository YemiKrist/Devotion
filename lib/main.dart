import 'dart:ui';

import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/text-theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return GetMaterialApp(
      title: 'CACSA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Euclid-Regular"
      ),
      // initialRoute: Pages.SPLASHSCREEN,
      home: WelcomePage(),
      // getPages: Pages.routes,
    );
  }
}
