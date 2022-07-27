import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/constants/months.dart';
import 'package:cacsa/screens/events/months_event_view.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

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
                Text(
                  'Upcoming Events',
                  style: themeData.textTheme.headline3,
                ),
                addVerticalSpace(15),
                Expanded(
                    child: GridView.builder(
                  // childAspectRatio: 3/2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 0,
                      childAspectRatio: 2),
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
                                title: Text(
                                  months[index],
                                  style: themeData.textTheme.headline4,
                                ),
                                // subtitle: Text(daily_walks[index].topic,),
                                onTap: () {
                                  Get.to(Events(months[index]));
                                },
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
