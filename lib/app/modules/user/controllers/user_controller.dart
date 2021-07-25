import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laraveltest/app/modules/user/models/user.dart';
import 'package:laraveltest/app/modules/user/services/user_service.dart';
import 'package:laraveltest/app/routes/app_pages.dart';
import 'package:laraveltest/app/shared/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/shared/utils/show_getx_components.dart';
import 'package:laraveltest/app/modules/user/clearJsons/user.dart';

class UserController extends GetxController {
  final userService = Get.find<UserService>();
  RxBool isLoading = true.obs;
  var user = Rx<User>(userFromJson(clearUserJson));

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var userFetched = await userService.fetchUser();
      user(userFetched);
      isLoading(false);
      ShowGetxComponents.showSnackBar("Success", "Your account info has been updated.", Colors.lightBlue);
    } on CredentialsNotFoundException {
      ShowGetxComponents.showSnackBar(
          "Error",
          "Login failed, check your credentials or create a Account.",
          Colors.red);
    } catch (ex) {
      ShowGetxComponents.showDialog("Error", ex.toString(), Colors.red);
    }
  }

  void logout() {
    var box = Hive.box("db");
    box.delete("userToken");
    Get.offAllNamed(Routes.HOME);
  }


  @override
  void onClose() {}
}
