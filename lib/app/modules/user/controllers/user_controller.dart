import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraveltest/app/modules/user/services/user_service.dart';
import 'package:laraveltest/app/shared/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/shared/utils/show_getx_components.dart';

class UserController extends GetxController {
  final userService = Get.find<UserService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void test() async {
    try {
      var userToken = await userService.test();
      ShowGetxComponents.showSnackBar("Success", userToken!, Colors.lightBlue);
    } on CredentialsNotFoundException {
      ShowGetxComponents.showSnackBar(
          "Error",
          "Login failed, check your credentials or create a Account.",
          Colors.red);
    } catch (ex) {
      ShowGetxComponents.showDialog("Error", ex.toString(), Colors.red);
    }
  }


  @override
  void onClose() {}
}
