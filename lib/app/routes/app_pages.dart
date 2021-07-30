import 'package:get/get.dart';

import 'package:laraveltest/app/modules/home/bindings/home_binding.dart';
import 'package:laraveltest/app/modules/home/views/home_view.dart';
import 'package:laraveltest/app/modules/register/bindings/register_binding.dart';
import 'package:laraveltest/app/modules/register/views/register_view.dart';
import 'package:laraveltest/app/modules/user/bindings/user_binding.dart';
import 'package:laraveltest/app/modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
