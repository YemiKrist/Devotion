import 'package:cacsa/constants/account_details.dart';
import 'package:cacsa/models/accounts.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/appbar.dart';
import '../../commons/title.dart';
import '../../utils/widget_functions.dart';

class Give extends StatelessWidget {
  const Give({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    List<Accounts> accounts = AccountDetails.getAccountDetails();

    return Scaffold(
        backgroundColor: primaryBgColor,
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text("Account Number"),
                                          Text(accounts[index]
                                              .accountNumber
                                              .toString())
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () => FlutterClipboard.copy(
                                                  accounts[index]
                                                      .accountNumber
                                                      .toString())
                                              .then((value) =>
                                                  Get.snackbar("", "Copied!")),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: primaryBgColor,
                                            ),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Text(
                                                  "Copy",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: textColorWhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const Text("Account Name"),
                                            Text(accounts[index].accountName)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text("Bank Name"),
                                            Text(accounts[index].bankName)
                                          ],
                                        ),
                                      ])
                                ],
                              ),
                            ),
                            //addVerticalSpace(20),
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
