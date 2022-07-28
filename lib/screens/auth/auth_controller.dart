import 'dart:async';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 2), () {
      if (user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const Login());
      } else {
        isLoging = true;
        update();
        Get.to(() => WelcomePage());
      }
    });
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Login Failed", e);
    }
  }

  void postDetailsToFirestore() async {}

  void logout() async {
    await auth.signOut();
  }
}

getErrorSnackBar(String message, _) {
  Get.snackbar(
    "Error",
    "$message\n${_.message}",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: textColorWhite,
    borderRadius: 10,
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
  );
}

getSuccessSnackBar(String message) {
  Get.snackbar(
    "Success",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: primaryBgColor,
    colorText: textColorWhite,
    borderRadius: 10,
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
  );
}
