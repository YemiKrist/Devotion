import 'package:cacsa/constants/months.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/screens/months_screen.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:firebase_core/firebase_core.dart';
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
    //final Firebase user = AuthController.instance.user.uid;
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
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 0,
                    childAspectRatio: 2),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: menuItems.length,
                itemBuilder: (BuildContext cont, int index) {
                  return GestureDetector(
                    onTap: () => Get.to(const Months()),
                    child: SizedBox(
                      height: 130,
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Stack(
                          children: [
                            // Positioned.fill(
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        'assets/icons/${menuItems[index].icon}.png'),
                                  ),
                                  title: Text(
                                    menuItems[index].name,
                                    style: themeData.textTheme.headline4,
                                  ),
                                  // subtitle: Text(daily_walks[index].topic,),
                                  onTap: () {
                                    String name = "MONTHS";
                                    Get.toNamed('/${menuItems[index].route}');
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
              GestureDetector(
                onTap: () {
                  AuthController.instance.logout();
                },
                child: const Text("Logout"),
              )
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


