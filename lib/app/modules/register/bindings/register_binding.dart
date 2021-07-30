import 'package:get/get.dart';
import 'package:laraveltest/app/modules/register/services/register_service.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<RegisterService>(() => RegisterService());
  }
}
