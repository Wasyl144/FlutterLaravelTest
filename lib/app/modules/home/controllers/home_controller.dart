
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraveltest/app/modules/home/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/modules/home/services/login_service.dart';
import 'package:laraveltest/app/modules/home/utils/show_getx_components.dart';

class HomeController extends GetxController {

  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  var email = "";
  var password = "";

  late TextEditingController emailController, passwordController;

  final loginService = Get.find<LoginService>();

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
    if(passwd.length <= 4) {
      return "Password must be of 4 characters";
    }
    return null;
  }

  void login() async {
    try {
      var userToken = await loginService.login(email, password);
      ShowGetxComponents.showSnackBar("Success", "You're logged in!", Colors.lightBlue);
    } on CredentialsNotFoundException {
      ShowGetxComponents.showSnackBar("Error", "Login failed, check your credentials or create a Account.", Colors.red);
    }
    catch(ex) {
      ShowGetxComponents.showDialog("Error", ex.toString(), Colors.red);
    }


  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    login();
  }

}
