import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraveltest/app/modules/register/services/register_service.dart';
import 'package:laraveltest/app/routes/app_pages.dart';
import 'package:laraveltest/app/shared/utils/show_getx_components.dart';
import 'package:progress_state_button/progress_button.dart';

class RegisterController extends GetxController {
  var registerService = Get.find<RegisterService>();
  final registerFormKey = GlobalKey<FormState>();
  var email = "";
  var name = "";
  var password = "";
  var passwordConfirmation = "";
  var buttonState = ButtonState.idle.obs;

  var validationErrors = <String,dynamic>{}.obs;

  late TextEditingController emailController,
      passwordController,
      passwordConfirmationController,
      nameController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
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

  String? validatePasswordConfirmation(String passwd) {
    if (passwd != passwordController.text) {
      return "Passwords doesn't match";
    }
    if (passwd.isEmpty) {
      return "Password confirmation is required";
    }
    return null;
  }

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      buttonState(ButtonState.fail);
      ShowGetxComponents.showSnackBar(
          "Error!", "Check your credentials", Colors.red);
      return;
    }
    registerFormKey.currentState!.save();
    register();
  }

  void register() async {
    buttonState(ButtonState.loading);
    var formData = <String, dynamic>{};
    formData['name'] = name;
    formData['email'] = email;
    formData['password'] = password;
    formData['password_confirmation'] = passwordConfirmation;
    try {
      var result = await registerService.register(formData);
      if (result["errors"] != null) {
        validationErrors(result["errors"]);
        ShowGetxComponents.showSnackBar("Error", "Some fields are incorrect.", Colors.red);
        buttonState(ButtonState.fail);
      }
      else {
        buttonState(ButtonState.success);
        Get.back();
        ShowGetxComponents.showSnackBar("Success", "You have been registered. Please login to your account", Colors.green);
      }
    }
    catch (ex) {
      buttonState(ButtonState.fail);
      ShowGetxComponents.showSnackBar("Error", "Problem with connection to server.", Colors.red);
    }

  }
}
