import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/manuals.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
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
              children: [
                const MyWAppBar(),
                addVerticalSpace(25),
                Text(
                  'CACSA Manuals',
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
                                    leading: Image.asset(manualsIcon),
                                    title: Text(
                                      manuals[index],
                                      style: themeData.textTheme.headline4,
                                    ),
                                    trailing: Image.asset(ArrowIcon),
                                    onTap: () {},
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
