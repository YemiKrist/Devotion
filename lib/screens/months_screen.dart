import 'package:cacsa/constants/months.dart';
// import 'package:cacsa/constants/walks.dart';
import 'package:cacsa/models/daily_walk.dart';
import 'package:cacsa/screens/daily_walk.dart';
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
             margin: const EdgeInsets.symmetric(horizontal: 24),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyWAppBar(),
                addVerticalSpace(25),
                Text('Daily Walk',
                style: themeData.textTheme.headline3,
                 ),
                addVerticalSpace(15),
                Expanded(
                    child: GridView.builder(
                      // childAspectRatio: 3/2,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 0, childAspectRatio: 2

                      ),
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
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: ListTile(
                                    title: Text(months[index],style: themeData.textTheme.headline4,),
                                    // subtitle: Text(daily_walks[index].topic,),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DayWalk(months[index])));
                                    },
                                  )),
                        ],
                      ),
                    );
                  },
                )
                )
              ],
            ),
          ),
        ));
  }
}
