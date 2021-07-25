import 'dart:convert';

import 'package:get/get.dart';
import 'package:laraveltest/app/modules/home/exceptions/connection_with_server_exception.dart';
import 'package:laraveltest/app/modules/home/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/modules/home/helpers/connection_helper.dart';
import 'package:laraveltest/app/modules/home/services/api_service.dart';

class LoginService extends APIService{

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> login(String? email, String? password) async {

    if(!await ConnectionHelper.checkConnection()) {
      throw "Turn on mobile data or wifi";
    }
    final formData = FormData({
      "email": email,
      "password": password
    });

    var res = await httpClient.post("login", body: formData).timeout(Duration(seconds: 10));

    if(res.statusCode == 404) {
      throw CredentialsNotFoundException();
    }
    if(res.isOk) {
      var resString = res.bodyString;
      var resJson = jsonDecode(resString!);
      var token = resJson["auth_token"];
      print(token);

      return token;
    }
    throw ConnectionWithServerException();
  }
}