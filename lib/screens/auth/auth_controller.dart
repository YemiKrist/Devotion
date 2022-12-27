import 'dart:async';
import 'package:cacsa/models/user_model.dart';
import 'package:cacsa/routes/routes.dart';
import 'package:cacsa/screens/Bottombar.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/auth/success_view.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();
  late Rx<User?> _user;
  Rx<bool> isLoging = false.obs;
  Rx<bool> isSignUp = false.obs;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String name = "";
  //const name;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging.value ? 0 : 2), () {
      if (user == null) {
        isLoging.value = false;
        update();
        Get.offAll(() => const Login());
      } else if (isSignUp.value) {
        Get.offAll(() => const Success());
      } else {
        isLoging.value = true;
        update();
        Get.off(() =>const WelcomePage());
      }
    });
  }

  void login(email, password) async {
    try {
      isLoging.value = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // getUserDetails();
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Login Failed", e);
    }
  }

  void signUp(firstName, lastName, email, password, state, churchName) async {
    isSignUp.value = true;
    Get.offAll(() => const Success());
    try {
      isLoging.value = true;
      isSignUp.value = true;
      update();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              {postDetailsToFirestore(firstName, lastName, state, churchName)});
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Account creation Failed", e);
    }
  }

  void postDetailsToFirestore(firstName, lastName, state, churchName) async {
    //User? user = auth.currentUser;
    UserModel userModel = UserModel();

    userModel.firstName = firstName;
    userModel.lastName = lastName;
    userModel.state = state;
    userModel.churchName = churchName;
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.subscribed = false;

    // print(userModel.toMap());

    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  logout() async {
    await auth.signOut();
    isLoging.value = false;
  }

  // void getUserDetails() async {
  //   await firebaseFirestore
  //       .collection('users')
  //       .doc(user?.uid)
  //       .get()
  //       .then((value) => (name = value.data()?["firstName"]));
  //   print(name);

  //   //final firebaseUser = await FirebaseAuth.instance.currentUser!;
  //   // if(user!=null){
  //   //   await firebaseFirestore.collection('users').doc(user?.uid).get().then((value){
  //   //     name = value.data['']
  //   //   })
  //   // }
  //   //
  //   //return name;
  // }

  void resetPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Password reset Email has been sent !");
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Email error", e);
    }
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
