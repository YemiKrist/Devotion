import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //late Rx<User?> _user;
  bool isLoging = false;
  //User? get user = _user.value;

  @override
  void onReady() {
    super.onReady();
  }

  void login(email, password) {
    isLoging = true;
    print("Hello");
  }
}
