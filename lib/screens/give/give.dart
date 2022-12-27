import 'package:cacsa/constants/account_details.dart';
import 'package:cacsa/models/accounts.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/appbar.dart';
import '../../commons/navigation_bar.dart';
import '../../commons/title.dart';
import '../../utils/widget_functions.dart';

class Give extends StatelessWidget {
  const Give({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Accounts> accounts = AccountDetails.getAccountDetails();

    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
        backgroundColor: primaryBgColor,
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const MyWAppBar(),
                  addVerticalSpace(35),
                  const MyTitle(text: 'Give'),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 2.5),
                        padding: const EdgeInsets.only(bottom: 60),
                        shrinkWrap: true,
                        itemCount: accounts.length,
                        itemBuilder: (BuildContext cont, int index) {
                          return Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),

                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 9.0,
                                  bottom: 9.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Account Number",
                                            style: TextStyle(
                                              color: textColorGrey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: 'Euclid-Regular',
                                            ),
                                          ),
                                          Text(
                                            accounts[index]
                                                .accountNumber
                                                .toString(),
                                            style: const TextStyle(
                                              color: textColorGreen,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              fontFamily: 'Euclid-Bold',
                                            ),
                                          )
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () => FlutterClipboard.copy(
                                                accounts[index]
                                                    .accountNumber
                                                    .toString())
                                            .then((value) => Get.snackbar(
                                                "", "Copied!",
                                                backgroundColor: primaryBgColor,
                                                colorText: textColorWhite)),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 4.0),
                                            child: Text(
                                              "Copy",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Euclid-Regular',
                                                color: textColorWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Account Name",
                                          style: TextStyle(
                                            color: textColorGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: 'Euclid-Regular',
                                          ),
                                        ),
                                        Text(
                                          "Bank Name",
                                          style: TextStyle(
                                            color: textColorGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: 'Euclid-Regular',
                                          ),
                                        ),
                                      ]),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          accounts[index].accountName,
                                          style: const TextStyle(
                                            color: textColorBlack,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            fontFamily: 'Euclid-Regular',
                                          ),
                                        ),
                                        Text(
                                          accounts[index].bankName,
                                          style: const TextStyle(
                                            color: textColorBlack,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            fontFamily: 'Euclid-Regular',
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  //addVerticalSpace(20),
                                ],
                              ),
                            ),
                            // addVerticalSpace(20),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
