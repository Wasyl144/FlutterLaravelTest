
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  var email = "";
  var password = "";

  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail (String email) {
    if(!GetUtils.isEmail(email)) {
      return "Provide valid email address.";
    }
    return null;
  }

  String? validatePassword (String passwd) {
    print(passwd.length <= 6);

    if(passwd.length <= 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    print(isValid);
    if(!isValid) {
      print("ferer");
      return;
    }
    loginFormKey.currentState!.save();
  }

}
