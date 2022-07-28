import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/constants/events.dart';
import 'package:cacsa/models/daily_walk.dart';
import 'package:cacsa/models/event.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Events extends StatelessWidget {
  final String month;
  Events(this.month, {Key? key}) : super(key: key);

  List<Event> months_events = EventsList.getEvents();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    months_events =
        months_events.where((event) => event.month == month).toList();
    return Scaffold(
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                addVerticalSpace(25),
                Center(
                  child: Text(
                    month,
                    //style: themeData.textTheme.headline3,
                    style: const TextStyle(color: textColorGreen),
                    //textAlign: TextAlign.center,
                  ),
                ),
                addVerticalSpace(15),
                Expanded(
                    child: ListView.builder(
                  itemCount: months_events.length,
                  itemBuilder: (BuildContext cont, int index) {
                    return SizedBox(
                      height: 92,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Card(
                                  color: eventsBgColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    children: [
                                      Text("Week goes In here"),
                                      Divider(),
                                      Text("Days go in here"),
                                      Text("Devotion goes in here"),
                                    ],
                                  )

                                  // ListTile(
                                  //   leading: Text(
                                  //     months_events[index].week,
                                  //   ),
                                  //   title: Text(
                                  //     months_events[index].dates,
                                  //     style: themeData.textTheme.headline4,
                                  //   ),
                                  //   subtitle: Text(
                                  //     months_events[index].title,
                                  //   ),
                                  //   onTap: () {
                                  //     // Get.to(Events(month));
                                  //   },
                                  // )
                                  )),
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
