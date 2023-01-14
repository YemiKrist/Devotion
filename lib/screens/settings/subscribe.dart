import 'dart:developer';
import 'dart:io';

import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SubscribeToApp extends StatefulWidget {
  const SubscribeToApp({Key? key}) : super(key: key);

  @override
  State<SubscribeToApp> createState() => _SubscribeToAppState();
}

class _SubscribeToAppState extends State<SubscribeToApp> {
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

      Get.to(() => const SubscribeSuccess());
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
                      "Join Premium\nSubscribers",
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

class SubscribeSuccess extends StatefulWidget {
  const SubscribeSuccess({Key? key}) : super(key: key);

  @override
  State<SubscribeSuccess> createState() => _SubscribeSuccessState();
}

class _SubscribeSuccessState extends State<SubscribeSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
      backgroundColor: bgGrey,
      body: SafeArea(
          child: Container(
        // padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.15),
            const Align(
              child: Text(
                "Congrats!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontFamily: 'Euclid-Bold',
                ),
              ),
            ),
            SizedBox(height: heightSize(40)),
            const Align(
              child: Icon(
                Octicons.check_circle,
                color: primaryBgColor,
                size: 80,
              ),
            ),
            SizedBox(height: heightSize(40)),
            Align(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "You now have access to \n",
                  style: TextStyle(
                      color: textColorBlack,
                      fontSize: 16,
                      fontFamily: 'Euclid-Medium'),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'All Premium Contents',
                      style: TextStyle(
                        color: textColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Euclid-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: heightSize(50)),
            const Text(
              'Referral Phone Number',
              style: TextStyle(
                color: textColorBlack,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: 'Euclid-Bold',
              ),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
              height: heightSize(60),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Referral Phone Number",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: textColorBlack,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: textColorBlack,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: textColorBlack,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: textColorBlack,
                      ),
                    )),
              ),
            ),
            SizedBox(height: heightSize(10)),
            GestureDetector(
              onTap: () {
                // startPayment(context);
                Get.toNamed('/main_page');
              },
              child: Container(
                height: heightSize(60),
                decoration: BoxDecoration(
                  color: primaryBgColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: textColorWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Euclid-Medium'),
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize(20)),
            GestureDetector(
              onTap: () {
                Get.toNamed('/main_page');
              },
              child: Container(
                height: heightSize(60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: textColorBlack)),
                child: const Center(
                  child: Text(
                    "Not Reffered",
                    style: TextStyle(
                        color: textColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Euclid-Medium'),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
