import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/constants/about.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../commons/title_2.dart';

class MissionVision extends StatelessWidget {
  const MissionVision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    String mission = AboutData.getMission();
    String vision = AboutData.getVision();
    String coreValues = AboutData.getCoreValues();
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
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
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const MyTitle2(text: "Our Vision"),
                          addVerticalSpace(15),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              vision,
                              style: themeData.textTheme.bodyText1,
                            ),
                          ),
                          addVerticalSpace(35),
                          const MyTitle2(text: "Our Mission"),
                          addVerticalSpace(15),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              mission,
                              style: themeData.textTheme.bodyText1,
                            ),
                          ),
                          addVerticalSpace(35),
                          const MyTitle2(text: "Our Core Values"),
                          addVerticalSpace(15),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              coreValues,
                              style: themeData.textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
