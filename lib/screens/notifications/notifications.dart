import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({super.key});

  List<String> advert = [
    "Ads or\n Upcoming Events",
    "Ads or\n Upcoming Events",
    "Ads or\n Upcoming Events"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: bgGrey,
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            addVerticalSpace(20),
            const Center(
              child: Text(
                "Notifications",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColorGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    fontFamily: 'Euclid-Medium'),
              ),
            ),
            addVerticalSpace(10),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: advert.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20),
                            decoration: const BoxDecoration(
                                color: backgroundyellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  advert[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          addVerticalSpace(10)
                        ],
                      ),
                    );
                  })),
            )
          ]),
        ),
      ),
    );
  }
}
