import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:laraveltest/app/shared/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/modules/home/services/login_service.dart';
import 'package:laraveltest/app/shared/utils/show_getx_components.dart';
import 'package:laraveltest/app/routes/app_pages.dart';

class HomeController extends GetxController {
  HomeController() {
    dbBox = Hive.box("db");
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late Box dbBox;
  var isLoading = false.obs;

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

  String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Provide valid email address.";
    }
    return null;
  }

  String? validatePassword(String passwd) {
    if (passwd.length <= 4) {
      return "Password must be of 4 characters";
    }
    return null;
  }

  void login() async {
    try {
      isLoading(true);
      var userToken = await loginService.login(email, password);
      dbBox.put('userToken', userToken);
      ShowGetxComponents.showSnackBar(
          "Success", "You're logged in!", Colors.lightBlue);
      isLoading(false);
      Get.offAllNamed(Routes.USER);
    } on CredentialsNotFoundException {
      isLoading(false);
      ShowGetxComponents.showSnackBar(
          "Error",
          "Login failed, check your credentials or create a Account.",
          Colors.red);
    } catch (ex) {
      isLoading(false);
      ShowGetxComponents.showDialog("Error", ex.toString(), Colors.red);
    }
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    login();
  }
}
