import 'dart:convert';

import 'package:get/get.dart';
import 'package:laraveltest/app/modules/home/helpers/connection_helper.dart';
import 'package:laraveltest/app/modules/home/services/api_service.dart';

class LoginService extends APIService{

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> login(String? email, String? password) async {

    if(!ConnectionHelper.checkConnection()) {
      throw "Turn on mobile data or wifi";
    }
    final formData = FormData({
      "email": email,
      "password": password
    });

    var res = await httpClient.post("login", body: formData).timeout(Duration(seconds: 10));
    if(res.hasError) {
      throw "Username or password is incorrect";
    }
    var resString = res.bodyString;
    var resJson = jsonDecode(resString!);
    var token = resJson["auth_token"];

    return token;
  }
}