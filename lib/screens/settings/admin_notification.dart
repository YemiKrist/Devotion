import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/button.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminNotification extends StatefulWidget {
  const AdminNotification({Key? key}) : super(key: key);

  @override
  State<AdminNotification> createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List tokens = [];

  @override
  void initState() {
    super.initState();
    getTokenList();
  }

  getTokenList() async {
    try {
      log("hhh");
      FirebaseFirestore.instance.collection("users").get().then((value) {
        log(value.toString());
        log(value.docs.length.toString());
        for (var i in value.docs.toList()) {
          //log(i.data().toString());

          if (i.get("token").toString().isNotEmpty) {
            tokens.add(i.get("token"));
          }
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  sendBroadcast() async {
    try {
      if (tokens.isNotEmpty) {
        Get.snackbar("Notice", "Sending broadcast");

        for (var token in tokens) {
          broadcast(token);
        }
      } else {
        Get.snackbar("Notice", "Unable to get user's tokens");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  broadcast(token) async {
    try {
      var serverkey =
          "AAAAv02ey5A:APA91bG0ySSz1zM0yZ9mz6F5GVAfB8nOgTkt78LyHtGzVdtVi-dfIltNpIU9RrasVVPOxz-dgtoiSuutzHr5c9FPxTxzW4XrBXXgYr636HHw9Iu2POByCZV9eV3duHT4VEh8Gr-h-lre";
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Authorization': 'key=$serverkey',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          // "message": {
          "to": token,
          "collapse_key": "type_a",
          "priority": "high",
          "notification": {
            "title": titleController.text,
            "body": descriptionController.text,
          },
          "data": {
            "sound": "default",
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
          }
        }),
      );
      var data = response.body;

      log(data.toString());

      final Completer<RemoteMessage> completerr = Completer<RemoteMessage>();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        completerr.complete(message);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getTokenList();
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
      backgroundColor: bgGrey,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              const Text(
                "Broadcast Notifications",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColorGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'Euclid-Medium'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Listener(
                    onPointerUp: (_) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild!.unfocus();
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColorBlack.withOpacity(0.2),
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: 'Euclid-Medium'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(color: textColorSub),
                            hintStyle: const TextStyle(color: textColorSub),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Description",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColorBlack.withOpacity(0.2),
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: 'Euclid-Medium'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 6,
                          decoration: InputDecoration(
                            // fillColor: textColorBlack.withOpacity(0.1),
                            // filled: true,
                            labelStyle: const TextStyle(color: textColorSub),
                            hintStyle: const TextStyle(color: textColorSub),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: textColorSub.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        AppButtons(
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          borderColor: Colors.black,
                          text: "Broadcast",
                          onTap: () {
                            if (titleController.text.isEmpty ||
                                descriptionController.text.isEmpty) {
                              Get.snackbar(
                                  "Notice", "Both fields has to field");
                            } else {
                              sendBroadcast();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
