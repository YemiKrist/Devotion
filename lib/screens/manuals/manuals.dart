import 'dart:math';

import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/manuals.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

class Manuals extends StatelessWidget {
  const Manuals({Key? key}) : super(key: key);

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
              mainAxisSize: MainAxisSize.max,
              children: [
                const MyWAppBar(),
                const MyTitle(text: 'CACSA\nMANUALS'),
                const Spacer(),
                Expanded(
                  child: Align(
                    ///alignment: FractionalOffset.bottomCenter,
                    child: ListView.builder(
                      //padding: const EdgeInsets.only(bottom: 60),
                      itemCount: manuals.length,
                      itemBuilder: (BuildContext cont, int index) {
                        return Container(
                          height: 70,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: ListTile(
                                title: Text(
                                  manuals[index],
                                  style: themeData.textTheme.headline4,
                                ),
                                trailing: Image.asset(ArrowIcon),
                                onTap: () {},
                              )),
                          //addVerticalSpace(20),
                        );
                      },
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
