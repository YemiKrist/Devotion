import 'dart:developer';
import 'dart:io';

import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
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

      Get.off(() => const WelcomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  text:
                      "Your account has been\nsuccessfully created! Proceed\nto make a ",
                  style: TextStyle(
                      color: textColorBlack,
                      fontSize: 16,
                      fontFamily: 'Euclid-Medium'),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'payment of NGN1000\nfor Premium Access Subscription ',
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
            GestureDetector(
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
                    "Subscribe",
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
                Get.off(() => const WelcomePage());
              },
              child: Container(
                height: heightSize(60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: textColorBlack)),
                child: const Center(
                  child: Text(
                    "Later",
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

  _handlePaymentInitialization(BuildContext context) async {
    final style = FlutterwaveStyle(
        appBarText: "Subscribe",
        buttonColor: primaryBgColor,
        appBarIcon: const Icon(Icons.message, color: primaryBgColor),
        buttonTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        appBarColor: primaryBgColor,
        appBarTitleTextStyle: const TextStyle(color: textColorWhite),
        dialogCancelTextStyle:
            const TextStyle(color: Colors.redAccent, fontSize: 18),
        dialogContinueTextStyle:
            const TextStyle(color: Colors.blue, fontSize: 18));

    final Customer customer = Customer(
        name: "FLW Developer",
        phoneNumber: "1234566677777",
        email: "customer@customer.com");

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: "FLWPUBK_TEST-b684ed769eb8267b99ccdec47de7e962-X",
        currency: "NGN",
        redirectUrl: "my_redirect_url",
        txRef: "unique_transaction_reference",
        amount: "3000",
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      print(response.status);
      print("${response.toJson()}");
    } else {
      print("No Response!");
    }
  }
}
