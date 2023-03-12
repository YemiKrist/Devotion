import 'dart:developer';
import 'dart:io';

import 'package:cacsa/c_a_c_s_a_icons_icons.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/models/user_model.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/menuItems.dart';
import '../models/menu.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Menu> menuItems = MenuItems.getMenuItems();
  String iconName = "dailyworkbold";
  String userName = "";
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  bool hasFullAccess = false;

  List<IconData> icons = [
    CACSAIcons.dailyworkbold,
    CACSAIcons.manualbold,
    CACSAIcons.locationbold,
    CACSAIcons.infobold,
    CACSAIcons.cardbold,
    CACSAIcons.mediabold
  ];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) async {
      loggedInUser = UserModel.fromMap(value.data());
      storeUser(loggedInUser.firstName!, user!.email!);
      getSubscriptionState();
      String token = await firebaseMessaging.getToken() ?? "";
      FirebaseFirestore.instance
          .collection("users")
          .doc(user?.uid)
          .update({"token": token});
      setState(() {
        userName = loggedInUser.firstName!;
      });
    });
  }

  storeUser(String name, String email) async {
    log("------____$email");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('CACSA', name);
    pref.setString('userEmail', email);
  }

  getSubscriptionState() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection("subscriptions")
          .doc(user!.uid)
          .get();
      if (result.exists) {
        setState(() {
          hasFullAccess = true;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //Future<String> name = AuthController.instance.getUserDetails().then((value) => );
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    log(MediaQuery.of(context).size.width.toString());

    return Scaffold(
        backgroundColor: primaryBgColor,
        bottomNavigationBar: const MyNavBar(),
        body: Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(40),
              // Center(child: Image.asset(("assets/ads.png"))),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                decoration: const BoxDecoration(
                    color: backgroundyellow,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Ads or\n Upcoming Events",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),

              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      'Welcome, $userName',
                      style: themeData.textTheme.headline3,
                    ),
                  ),
                  IconButton(
                      onPressed: (() {
                        Get.toNamed('/settings');
                      }),
                      icon: const Icon(
                        CACSAIcons.settingsbold,
                        color: splashBackgroundColor,
                      ))
                  //const Image(image: AssetImage('assets/icons/Hambuger.png'))
                ],
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    childAspectRatio: 1.3,
                  ),
                  //padding: const EdgeInsets.only(bottom: 60),
                  itemCount: menuItems.length,
                  itemBuilder: (BuildContext cont, int index) {
                    return GestureDetector(
                      onTap: () {
                        //if (menuItems[index].route == 'logout')
                        // {
                        //   Get.defaultDialog(
                        //     title: "",
                        //     content: Column(
                        //       children: [
                        //         Image.asset(("assets/icons/log-out.png")),
                        //         const Text(
                        //           "Log Out",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black),
                        //         ),
                        //         const Text(
                        //           "Are you sure you\nwant to logout",
                        //           style: TextStyle(
                        //               color: textColorBlack,
                        //               fontSize: 16,
                        //               fontFamily: 'Euclid-Medium'),
                        //         )
                        //       ],
                        //     ),
                        //     actions: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         mainAxisSize: MainAxisSize.max,
                        //         children: [
                        //           ElevatedButton(
                        //             onPressed: () {
                        //               AuthController.instance.logout();
                        //             },
                        //             style: ElevatedButton.styleFrom(
                        //               primary: Colors.white,
                        //               side: const BorderSide(
                        //                   color: borderColor),
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(12.0)),
                        //               minimumSize: const Size(120, 35),
                        //             ),
                        //             child: const Text(
                        //               "yes",
                        //               style: TextStyle(
                        //                   color: textColorBlack,
                        //                   fontFamily: 'Euclid-Normal'),
                        //             ),
                        //           ),
                        //           ElevatedButton(
                        //               style: ElevatedButton.styleFrom(
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         BorderRadius.circular(
                        //                             12.0)),
                        //                 minimumSize: const Size(120, 35),
                        //               ),
                        //               onPressed: () {
                        //                 Get.close(1);
                        //               },
                        //               child: const Text(
                        //                 "no",
                        //                 style: TextStyle(
                        //                     fontFamily: 'Euclid-Normal'),
                        //               ))
                        //         ],
                        //       )
                        //     ],
                        //     // textConfirm: "Yes",
                        //     // confirmTextColor: Colors.white,
                        //     // textCancel: "no",
                        //     // onConfirm: () =>
                        //     //     AuthController.instance.logout(),
                        //     // cancelTextColor: Colors.black
                        //   )
                        // }
                        // else

                        if (menuItems[index].route == 'months' ||
                            menuItems[index].route == 'manuals') {
                          Get.toNamed('/${menuItems[index].route}');
                        } else {
                          Get.toNamed('/${menuItems[index].route}');
                        }
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: splashBackgroundColor),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                color: primaryBgColor,
                                size: 35,
                              ),

                              // Image.asset(
                              //     'assets/icons/${menuItems[index].icon}.png'),
                              // addVerticalSpace(5),

                              Text(
                                menuItems[index].name,
                                textAlign: TextAlign.center,
                                style: themeData.textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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

class PremiumSubscriber extends StatefulWidget {
  const PremiumSubscriber({Key? key}) : super(key: key);

  @override
  State<PremiumSubscriber> createState() => _PremiumSubscriberState();
}

class _PremiumSubscriberState extends State<PremiumSubscriber> {
  final plugin = PaystackPlugin();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    plugin.initialize(
        publicKey: "pk_live_9a9877d30354743c6427859abab34f73a79a1f0a");
    super.initState();
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFromCACSA${platform}_${DateTime.now()}';
  }

  startPayment(context) async {
    String reference = _getReference();
    String amount = "100000";
    Charge charge = Charge()
      ..amount = int.parse(amount)
      ..reference = reference
      // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = "customer@customer.com";
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
    if (response.status == true) {
      // dashboardController.creditWallet(response.reference);
      log('Subscription Payment completed');
      Get.snackbar("Notice", "Subscription successful. Please wait...");

      await FirebaseFirestore.instance
          .collection("subscriptions")
          .doc(user!.uid)
          .set({
        "userID": user!.uid,
        "email": user!.email,
      });

      Get.toNamed('/main_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      bottomNavigationBar: const MyNavBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              addVerticalSpace(20),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: const [
                    Icon(
                      Feather.arrow_left_circle,
                      color: textColorWhite,
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: textColorWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Euclid-Medium'),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: heightSize(350),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: splashBackgroundColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: heightSize(20)),
                    const Icon(
                      Icons.credit_card,
                      size: 80,
                      color: primaryBgColor,
                    ),
                    SizedBox(height: heightSize(10)),
                    const Text(
                      "For Premium\nSubscribers Alone",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        fontFamily: 'Euclid-Bold',
                      ),
                    ),
                    SizedBox(height: heightSize(20)),
                    const Text(
                      "Subscription cost NGN1000",
                      style: TextStyle(
                          color: textColorBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Euclid-Medium'),
                    ),
                    SizedBox(height: heightSize(30)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                startPayment(context);
                              },
                              child: Container(
                                height: heightSize(60),
                                decoration: BoxDecoration(
                                  color: primaryBgColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                        color: textColorWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        fontFamily: 'Euclid-Medium'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: widthSize(15)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: heightSize(60),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: primaryBgColor)),
                                child: const Center(
                                  child: Text(
                                    "Go Back",
                                    style: TextStyle(
                                        color: primaryBgColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        fontFamily: 'Euclid-Medium'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
