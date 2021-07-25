import 'package:laraveltest/app/modules/home/helpers/connection_helper.dart';
import 'package:laraveltest/app/modules/user/models/user.dart';
import 'package:laraveltest/app/shared/exceptions/connection_with_server_exception.dart';
import 'package:laraveltest/app/shared/exceptions/credentials_not_found_exception.dart';
import 'package:laraveltest/app/shared/services/api_service.dart';

class UserService extends APIService {

  void onInit() {
    super.onInit();
  }

  Future<String?> test() async {
    if (!await ConnectionHelper.checkConnection()) {
      throw "Turn on mobile data or wifi";
    }

    var res = await httpClient.get("user").timeout(Duration(seconds: 10));

    if (res.statusCode == 404) {
      throw CredentialsNotFoundException();
    }
    if (res.isOk) {
      var resString = res.bodyString;
      return resString;
    }
    throw ConnectionWithServerException();
  }

  Future<User> fetchUser() async {
    if (!await ConnectionHelper.checkConnection()) {
      throw "Turn on mobile data or wifi";
    }

    var res = await httpClient.get("user").timeout(Duration(seconds: 10));

    if (res.statusCode == 404) {
      throw CredentialsNotFoundException();
    }
    if (res.isOk) {
      var resString = res.bodyString;
      return userFromJson(resString!);
    }
    throw ConnectionWithServerException();
  }
}