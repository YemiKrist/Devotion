import 'package:cacsa/models/believers_treasure.dart';
import 'package:cacsa/screens/daily_walk.dart';
import 'package:cacsa/screens/manuals/bible_study.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../commons/appbar.dart';
import '../../commons/navigation_bar.dart';
import '../../constants/studies.dart';

class Studies extends StatelessWidget {
  Studies({Key? key}) : super(key: key);

  List<Study> treasure = SudyList.getStudies();

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
              children: [
                const MyWAppBar(),
                addVerticalSpace(25),
                Text(
                  'Believers\' Treasure',
                  style: themeData.textTheme.headline3,
                ),
                addVerticalSpace(15),
                Expanded(
                    child: ListView.builder(
                  itemCount: treasure.length,
                  itemBuilder: (BuildContext cont, int index) {
                    return SizedBox(
                      height: 72,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: ListTile(
                                    title: Text(
                                      "STUDY ${treasure[index].id}",
                                      style: themeData.textTheme.headline4,
                                    ),
                                    subtitle: Text(
                                      treasure[index].topic,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BelieversTreasure(
                                                      treasure[index])));
                                    },
                                  ))),
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ));
  }
}
