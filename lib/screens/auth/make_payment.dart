import 'dart:developer';
import 'dart:io';

import 'package:cacsa/commons/button.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: deviceHeight * 0.85,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Make Payment",
                  ),
                  Image.asset(creditCard),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        text: 'Proceed to make a payment',
                        children: <TextSpan>[
                          TextSpan(text: " of\n"),
                          TextSpan(
                              text: "NGN3000",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                  ),
                  AppButtons(
                    textColor: Colors.white,
                    backgroundColor: primaryBgColor,
                    borderColor: Colors.transparent,
                    text: "Subscribe",
                    onTap: () {
                      startPayment(context);

                      //Get.offAllNamed(Routes.REFERAL);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
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
