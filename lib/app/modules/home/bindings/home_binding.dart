import 'package:get/get.dart';
import 'package:laraveltest/app/modules/home/services/login_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LoginService>(() => LoginService());
  }
}
