import 'dart:async';
import 'package:cacsa/models/user_model.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
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
    Timer(Duration(seconds: isLoging ? 0 : 2), () {
      if (user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const Login());
      } else {
        isLoging = true;
        update();
        Get.off(() => WelcomePage(), arguments: name);
      }
    });
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getUserDetails();
      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Login Failed", e);
    }
  }

  void signUp(firstName, lastName, email, password, state, churchName) async {
    try {
      isLoging = true;
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

    // print(userModel.toMap());

    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  void logout() async {
    await auth.signOut();
  }

  void getUserDetails() async {
    await firebaseFirestore
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) => (name = value.data()?["firstName"]));
    print(name);

    //final firebaseUser = await FirebaseAuth.instance.currentUser!;
    // if(user!=null){
    //   await firebaseFirestore.collection('users').doc(user?.uid).get().then((value){
    //     name = value.data['']
    //   })
    // }
    //
    //return name;
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
