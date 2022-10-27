import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/models/user_model.dart';
import 'package:cacsa/screens/auth/auth_controller.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constants/menuItems.dart';
import '../models/menu.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Menu> menuItems = MenuItems.getMenuItems();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  //Future<String> name = AuthController.instance.getUserDetails().then((value) => );
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    //print(name);
    return Scaffold(
        backgroundColor: primaryBgColor,
        bottomNavigationBar: const MyNavBar(),
        body: Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      'Welcome, ${loggedInUser.firstName}',
                      style: themeData.textTheme.headline2,
                    ),
                  ),
                  IconButton(
                      onPressed: (() {
                        Get.toNamed('/settings');
                      }),
                      icon: const Icon(
                        FontAwesomeIcons.gear,
                        color: splashBackgroundColor,
                      ))
                  //const Image(image: AssetImage('assets/icons/Hambuger.png'))
                ],
              ),

              addVerticalSpace(10),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.4,
                    ),
                    shrinkWrap: true,
                    //padding: const EdgeInsets.only(bottom: 60),
                    itemCount: menuItems.length,
                    itemBuilder: (BuildContext cont, int index) {
                      return GestureDetector(
                        onTap: () => {
                          if (menuItems[index].route == 'logout')
                            {
                              Get.defaultDialog(
                                title: "",
                                content: Column(
                                  children: [
                                    Image.asset(("assets/icons/log-out.png")),
                                    const Text(
                                      "Log Out",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const Text(
                                      "Are you sure you\nwant to logout",
                                      style: TextStyle(
                                          color: textColorBlack,
                                          fontSize: 16,
                                          fontFamily: 'Euclid-Medium'),
                                    )
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          AuthController.instance.logout();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          side: const BorderSide(
                                              color: borderColor),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          minimumSize: const Size(120, 35),
                                        ),
                                        child: const Text(
                                          "yes",
                                          style: TextStyle(
                                              color: textColorBlack,
                                              fontFamily: 'Euclid-Normal'),
                                        ),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            minimumSize: const Size(120, 35),
                                          ),
                                          onPressed: () {
                                            Get.close(1);
                                          },
                                          child: const Text(
                                            "no",
                                            style: TextStyle(
                                                fontFamily: 'Euclid-Normal'),
                                          ))
                                    ],
                                  )
                                ],
                                // textConfirm: "Yes",
                                // confirmTextColor: Colors.white,
                                // textCancel: "no",
                                // onConfirm: () =>
                                //     AuthController.instance.logout(),
                                // cancelTextColor: Colors.black
                              )
                            }
                          else
                            Get.toNamed('/${menuItems[index].route}')
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: splashBackgroundColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                  'assets/icons/${menuItems[index].icon}.png'),
                              addVerticalSpace(10),
                              Text(
                                menuItems[index].name,
                                style: themeData.textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     AuthController.instance.logout();
              //   },
              //   child: const Text("Logout"),
              // )
            ],
          ),
        ));
  }
}
