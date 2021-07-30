import 'dart:convert';
import 'dart:io';

import 'package:laraveltest/app/config/config_connection.dart';
import 'package:laraveltest/app/modules/home/helpers/connection_helper.dart';
import 'package:laraveltest/app/shared/exceptions/connection_with_server_exception.dart';
import 'package:laraveltest/app/shared/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/shared/services/api_service.dart';

class RegisterService extends APIService
{
  void onInit() {
    super.onInit();
  }


  Future<Map<String,dynamic>> register(Map<String,dynamic> formData, {String? redirectUri}) async {

    if (!await ConnectionHelper.checkConnection()) {
      throw "Turn on mobile data or wifi";
    }

    var res = await httpClient
          .post(ConnectionConfig.API_REGISTER_ROUTE, body: formData)
          .timeout(Duration(seconds: 10));


    if (res.statusCode == 404) {
      throw CredentialsNotFoundException();
    }
    if (res.statusCode == 422) {
      var errors = jsonDecode(res.bodyString!);
      print(errors);
      return errors;
    }
    if (res.isOk) {
      var resString = res.bodyString;
      var resJson = jsonDecode(resString!);
      var token = resJson["status"];
      print(token);

      return resJson;
    }
    throw ConnectionWithServerException();
  }
}