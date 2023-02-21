import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../commons/navigation_bar.dart';
import '../../models/branches.dart';

class BranchList extends StatelessWidget {
  final BranchState stateBranches;

  const BranchList(this.stateBranches, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Container(
            // padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                Text(
                  stateBranches.state,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: 'Euclid-SemiBold',
                  ),
                ),
                addVerticalSpace(21),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Headquarters",
                            style: TextStyle(
                                color: primaryBgColor,
                                fontFamily: 'Euclid-Medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          addVerticalSpace(5),
                          Text(
                            stateBranches.headQuarters.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Euclid-Regular',
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Text(
                            stateBranches.headQuarters.address,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Euclid-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          addVerticalSpace(14),
                          const Text(
                            "Other Assembly Address",
                            style: TextStyle(
                                color: primaryBgColor,
                                fontFamily: 'Euclid-Medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          addVerticalSpace(5),
                          for (Branch assembly
                              in stateBranches.otherAssemblies) ...{
                            Text(
                              assembly.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Euclid-Regular',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            Text(assembly.address,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Euclid-Regular',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16)),
                            addVerticalSpace(10),
                          }
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Section extends StatelessWidget {
  final String title;
  final String content;

  const Section({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '$title: ', style: themeData.textTheme.headline4),
          TextSpan(text: content, style: themeData.textTheme.bodyText1)
        ]),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class SectionPrayer extends StatelessWidget {
  final String title;
  final List<String> prayerPoints;

  const SectionPrayer(
      {Key? key, required this.title, required this.prayerPoints})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return RichText(
        text: TextSpan(children: [
      TextSpan(text: '$title: ', style: themeData.textTheme.headline4),
      for (String prayer in prayerPoints) ...{
        TextSpan(text: '\n$prayer', style: themeData.textTheme.bodyText1),
      }
    ]));
  }
}
