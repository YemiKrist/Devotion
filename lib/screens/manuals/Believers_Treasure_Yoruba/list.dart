import 'package:cacsa/models/believers_treasure.dart';
import 'package:cacsa/screens/manuals/bible_study.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../../commons/appbar.dart';
import '../../../commons/navigation_bar.dart';
import '../../../constants/studies_yoruba.dart';

class AwonEko extends StatelessWidget {
  AwonEko({Key? key}) : super(key: key);

  List<Study> treasure = YorubaSudyList.getYorubaStudies();
  Map<int, String> numbers = {
    1: "KIN-IN-NI",
    2: "KEJI",
    3: "KETA",
    4: "KERIN",
    5: "KARUN",
    6: "KEFA",
    7: "KEJE",
    8: "KEJO",
    9: "KESAN",
    10: "KEWA",
    11: "KOKANLA",
    12: "KEJILA",
    13: "KETALA",
    14: "KERINLA",
    15: "KEEDOGUN",
    16: "KERINDINLOGUN",
    17: "KETADINLOGUN",
    18: "KEJIDINLOGUN",
    19: "KOKANDINLOGUN",
    20: "OGUN",
  };
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
                                      "EKO ${numbers[treasure[index].id]}",
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
                                                      treasure[index], false)));
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
