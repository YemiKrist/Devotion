import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/constants/events.dart';
import 'package:cacsa/models/event.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Events extends StatefulWidget {
  final String month;
  Events(this.month, {Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Event> months_events = EventsList.getEvents();

  @override
  Widget build(BuildContext context) {
    Rx<bool> cleared = false.obs;

    final ThemeData themeData = Theme.of(context);
    months_events =
        months_events.where((event) => event.month == widget.month).toList();
    return Scaffold(
        backgroundColor: bgGrey,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                // addVerticalSpace(5),
                Center(
                  child: Text(
                    widget.month,
                    style: const TextStyle(
                        color: textColorGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                        fontFamily: 'Euclid-Medium'),
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: months_events.length,
                    itemBuilder: (BuildContext cont, int index) {
                      return SizedBox(
                        height: 158,
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              months_events[index].week,
                              style: const TextStyle(
                                  color: textColorBlack,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 15, bottom: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: bgWhite,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        months_events[index].dates,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: primaryBgColor),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          cleared.value == false
                                              ? CACSAIcons.notificationbold
                                              : CACSAIcons.notificationnormal,
                                          color: cleared.value == true
                                              ? null
                                              : primaryBgColor,
                                        ),
                                      )
                                    ]),
                                Row(
                                  children: [
                                    Expanded(
                                        child: months_events[index].title == ""
                                            ? const Center(
                                                child: Text(" NO Event"))
                                            : Text(
                                                months_events[index].title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
