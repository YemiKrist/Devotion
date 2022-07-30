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
                    style: const TextStyle(
                        color: textColorGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                        fontFamily: 'Euclid-Medium'),
                  ),
                ),
                addVerticalSpace(15),
                Expanded(
                    child: ListView.builder(
                  itemCount: months_events.length,
                  itemBuilder: (BuildContext cont, int index) {
                    return SizedBox(
                      height: 115,
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
                                      Text(
                                        months_events[index].week,
                                        style: const TextStyle(
                                          color: textColorBlack,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontFamily: 'Euclid-Medium',
                                        ),
                                      ),
                                      const Divider(
                                          thickness: 0.5,
                                          indent: 7,
                                          endIndent: 7,
                                          color: borderColor),
                                      Text(
                                        months_events[index].dates,
                                        style: const TextStyle(
                                          color: textColorGreen,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          fontFamily: 'Euclid-Medium',
                                        ),
                                      ),
                                      months_events[index].title == ""
                                          ? const Text("No Event")
                                          : Text(
                                              months_events[index].title,
                                            ),
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
