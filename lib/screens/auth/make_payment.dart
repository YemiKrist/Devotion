import 'dart:ui';

import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/input_textfield.dart';
import 'package:cacsa/constants/assets_path.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';

class MakePayment extends StatelessWidget {
  const MakePayment({Key? key}) : super(key: key);

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
                      _handlePaymentInitialization(context);

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
        buttonColor: const Color(0xffd0ebff),
        appBarIcon: const Icon(Icons.message, color: Color(0xffd0ebff)),
        buttonTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        appBarColor: const Color(0xffd0ebff),
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
