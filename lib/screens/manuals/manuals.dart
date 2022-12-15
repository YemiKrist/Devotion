import 'dart:math';

import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/manuals.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/widget_functions.dart';

class Manuals extends StatelessWidget {
  const Manuals({Key? key}) : super(key: key);

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
                // addVerticalSpace(10),
                const Expanded(child: MyTitle(text: 'CACSA\nMANUALS')),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 5),
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      itemCount: manuals.length,
                      itemBuilder: (BuildContext cont, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            title: Text(
                              manuals[index],
                              style: themeData.textTheme.headline4,
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(ArrowIcon),
                            ),
                            onTap: () {},
                          ),
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
