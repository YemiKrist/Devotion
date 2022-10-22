import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/months.dart';
// import 'package:cacsa/constants/walks.dart';
import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../commons/appbar.dart';

class Months extends StatelessWidget {
  const Months({Key? key}) : super(key: key);

  // List<Walk> daily_walks = DailyWalks.getWalks();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
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
                const Expanded(
                  child: MyTitle(
                    text: 'Daily Walk\n2022',
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 0,
                                childAspectRatio: 3),
                        shrinkWrap: true,
                        itemCount: months.length,
                        itemBuilder: (BuildContext cont, int index) {
                          return SizedBox(
                            height: 8,
                            child: Stack(
                              children: [
                                // Positioned.fill(
                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: ListTile(
                                      title: Text(
                                        months[index],
                                        style: themeData.textTheme.headline4,
                                      ),
                                      // subtitle: Text(daily_walks[index].topic,),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DayWalk(months[index])));
                                      },
                                    )),
                              ],
                            ),
                          );
                        },
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
