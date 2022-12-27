import 'package:cacsa/constants/walks.dart';
import 'package:cacsa/models/daily_walk.dart';
import 'package:cacsa/screens/daily_walk.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../commons/appbar.dart';
import '../commons/navigation_bar.dart';

class DayWalk extends StatelessWidget {
  final String month;
  DayWalk(this.month, {Key? key}) : super(key: key);

  List<Walk> daily_walks = DailyWalks.getWalks();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    daily_walks = daily_walks.where((walk) => walk.month == month).toList();
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
                  'Daily Walk',
                  style: themeData.textTheme.headline3,
                ),
                addVerticalSpace(15),
                Expanded(
                    child: ListView.builder(
                  itemCount: daily_walks.length,
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
                                      daily_walks[index].date,
                                      style: themeData.textTheme.headline4,
                                    ),
                                    subtitle: Text(
                                      daily_walks[index].topic,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Daily(daily_walks[index])));
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
