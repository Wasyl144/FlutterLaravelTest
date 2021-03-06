import 'package:get/get.dart';
import 'package:laraveltest/app/modules/user/services/user_service.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<UserService>(() => UserService());
  }
}
