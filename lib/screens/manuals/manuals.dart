import 'dart:math';

import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/menuItems.dart';
import 'package:cacsa/models/manuals_model.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widget_functions.dart';

class Manuals extends StatelessWidget {
  Manuals({Key? key}) : super(key: key);

  List<ManualsMenu> manuals = MenuItems.getManualsItems();
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
                addVerticalSpace(35),
                const Expanded(child: MyTitle(text: 'CACSA\nManuals')),
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
                              manuals[index].name,
                              style: themeData.textTheme.headline4,
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(ArrowIcon),
                            ),
                            onTap: () {
                              Get.toNamed('/${manuals[index].route}');
                            },
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
