import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/commons/title.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location {
  String name;
  String route;

  Location({required this.name, required this.route});
}

class BranchLocationsMenu extends StatelessWidget {
  BranchLocationsMenu({Key? key}) : super(key: key);

  List<Location> locations = [
    Location(name: "Churches", route: "churches"),
    Location(name: "Higher Institutions Fellowships", route: "higher")
  ];
  //final List<BranchState> branches = BranchLocations.getBranches();
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
                //addVerticalSpace(5),
                const Expanded(
                    flex: 3, child: MyTitle(text: 'Branch\nLocations')),
                Expanded(
                  flex: 1,
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
                      itemCount: locations.length,
                      itemBuilder: (BuildContext cont, int index) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            title: Text(
                              locations[index].name.toString(),
                              style: themeData.textTheme.headline4,
                            ),
                            trailing: Image.asset(arrowIcon),
                            onTap: () {
                              Get.toNamed('/${locations[index].route}');
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
