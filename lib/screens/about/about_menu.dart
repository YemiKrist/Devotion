import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/manuals.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/about_menu.dart';
import '../../models/about_menu.dart';
import '../../utils/widget_functions.dart';

class AboutMenu extends StatelessWidget {
  AboutMenu({Key? key}) : super(key: key);

  List<AboutLMenu> aboutItems = AboutMenuItems.getMenuItems();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
        child: Container(
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          //  margin: const EdgeInsets.symmetric(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const MyWAppBar(),
                addVerticalSpace(35),
                const MyTitle(text: 'About\nCACSA'),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GridView.builder(
                      //padding: const EdgeInsets.only(bottom: 60),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 5),
                      padding: const EdgeInsets.only(bottom: 60),
                      shrinkWrap: true,
                      itemCount: manuals.length,
                      itemBuilder: (BuildContext cont, int index) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ListTile(
                                title: Text(
                                  aboutItems[index].name,
                                  style: themeData.textTheme.headline4,
                                ),
                                trailing: Image.asset(ArrowIcon),
                                onTap: () => Get.toNamed(
                                    '/${aboutItems[index].route}')));
                        //addVerticalSpace(20),
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
