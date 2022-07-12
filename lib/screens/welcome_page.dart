import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/screens/months_screen.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/menuItems.dart';
import '../models/menu.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  List<Menu> menuItems = MenuItems.getMenuItems();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: primaryBgColor,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(111),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Welcome, ',
                  style: themeData.textTheme.headline2,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: menuItems.length,
                itemBuilder: (BuildContext cont, int index) {
                  return GestureDetector(
                    onTap:()=> Get.to(const Months()),
                    child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 124,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(22)),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.4),
                                      BlendMode.multiply,
                                    ),
                                    image: AssetImage(
                                        'assets/${menuItems[index].bgImage}.png'),
                                  ),
                                  //   gradient: LinearGradient(colors: [
                                  // gradientColor1.withOpacity(0.0),
                                  // gradientColor2.withOpacity(1.0),
                                  // ])
                                ),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                menuItems[index].name,
                                style: themeData.textTheme.headline1,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  );

                },
              ))
            ],
          ),
        ));
  }
}



// class _WelcomePageState extends State<WelcomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryBgColor,
//       appBar: AppBar(
//         title: const Text('Welcome'),
//       ),
//       body: Container(
//         child: Column(
//           children: const [
//             Text('Welcome, '),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (BuildContext cont, int index){

//                 }
//               )
//             )
//           ],
//         ),
//       )
//     );
//   }
// }


