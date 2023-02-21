import 'package:cacsa/constants/discipleship_manual.dart';
import 'package:cacsa/models/believers_class.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../../commons/appbar.dart';
import '../../../commons/navigation_bar.dart';
import 'manual.dart';

class WorkersManuals extends StatelessWidget {
  const WorkersManuals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    List<Class> manuals = WorkersMaualList.getList();

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
                  'Workers\' Manual',
                  style: themeData.textTheme.headline3,
                ),
                addVerticalSpace(15),
                Expanded(
                    child: ListView.builder(
                  itemCount: manuals.length,
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
                                      manuals[index].number == "FOREWARD"
                                          ? "FOREWARD"
                                          : (manuals[index].number == "PREFACE"
                                              ? "PREFACE"
                                              : "CHAPTER ${manuals[index].number}"),
                                      style: themeData.textTheme.headline4,
                                    ),
                                    subtitle: Text(
                                      manuals[index].topic,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkersManual(
                                                      manuals[index].number)));
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
