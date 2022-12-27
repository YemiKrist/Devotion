import '../commons/navigation_bar.dart';
import '../utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../commons/appbar.dart';

class Misc extends StatelessWidget {
  const Misc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
        backgroundColor: primaryBgColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const MyWAppBar(),
                addVerticalSpace(35),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(),
                  // child: ListTile(
                  //   title: Text(
                  //     "Work in Progress",
                  //     style: themeData.textTheme.headline4,
                  //   ),

                  //   // subtitle: Text(daily_walks[index].topic,),
                  //   onTap: () => Navigator.of(context).pop(),
                  // )),
                ),
              ],
            ),
          ),
        ));
  }
}
