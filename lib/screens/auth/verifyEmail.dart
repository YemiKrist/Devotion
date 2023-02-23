import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class VerifyEmail extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String state;
  final String churchName;

  const VerifyEmail(this.firstName, this.lastName, this.state, this.churchName,
      {Key? key})
      : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _verificationCodeController = TextEditingController();

  void _verifyEmail() async {
    try {
      final User? user = AuthController.instance.user;

      if (user != null) {
        final credential = EmailAuthProvider.credential(
            email: user.email!, password: user.uid);
        await user.reauthenticateWithCredential(credential);
        await user.reload();
        if (user.emailVerified) {
          AuthController.instance.postDetailsToFirestore(widget.firstName,
              widget.lastName, widget.state, widget.churchName);
          log("herere");
          // Navigate to home screen
          //Get.offAll(() => const Home());
        } else {
          Get.snackbar("Email verification failed",
              "Please enter a valid verification code.",
              duration: const Duration(seconds: 5));
        }
      }
    } on FirebaseAuthException catch (e) {
      log("Error: $e");
    }
  }

  @override
  void dispose() {
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "A verification code has been sent to your email. Please enter the code below."),
            const SizedBox(height: 16),
            TextField(
              controller: _verificationCodeController,
              decoration: const InputDecoration(
                labelText: "Verification Code",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyEmail,
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
