import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/months.dart';
// import 'package:cacsa/constants/walks.dart';
import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../commons/appbar.dart';
import '../commons/navigation_bar.dart';

class Months extends StatelessWidget {
  const Months({Key? key}) : super(key: key);

  // List<Walk> daily_walks = DailyWalks.getWalks();

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
                                        if (months[index] == "July" ||
                                            months[index] == "August" ||
                                            months[index] == "September" ||
                                            months[index] == "October" ||
                                            months[index] == "November" ||
                                            months[index] == "December") {
                                          Get.to(() => const WorkInProgress());
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DayWalk(months[index])));
                                        }
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

class WorkInProgress extends StatefulWidget {
  const WorkInProgress({Key? key}) : super(key: key);

  @override
  State<WorkInProgress> createState() => _WorkInProgressState();
}

class _WorkInProgressState extends State<WorkInProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      bottomNavigationBar: const MyNavBar(),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            addVerticalSpace(20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: const [
                  Icon(
                    Feather.arrow_left_circle,
                    color: textColorWhite,
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: textColorWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Euclid-Medium'),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: heightSize(350),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: splashBackgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: heightSize(20)),
                  const Icon(
                    Octicons.alert,
                    size: 80,
                    color: primaryBgColor,
                  ),
                  SizedBox(height: heightSize(20)),
                  const Text(
                    "Work in Pogress",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: 'Euclid-Bold',
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: heightSize(60),
                        decoration: BoxDecoration(
                          color: primaryBgColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                                color: textColorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Euclid-Medium'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
