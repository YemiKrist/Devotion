import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/constants/branch_locations.dart';
import 'package:cacsa/screens/branches/Branch_list.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../models/branches.dart';

class Branches extends StatelessWidget {
  Branches({Key? key}) : super(key: key);

  List<BranchState> branches = BranchLocations.getBranches();
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
                //addVerticalSpace(5),
                const Expanded(child: MyTitle(text: 'Branch\nLocations')),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 6,
                              childAspectRatio: 6),
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      itemCount: branches.length,
                      itemBuilder: (BuildContext cont, int index) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            title: Text(
                              branches[index].state,
                              style: themeData.textTheme.headline4,
                            ),
                            trailing: Image.asset(ArrowIcon),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BranchList(branches[index])));
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
