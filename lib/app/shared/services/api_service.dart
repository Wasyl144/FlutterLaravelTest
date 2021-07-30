import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hive/hive.dart';
import 'package:laraveltest/app/config/config_connection.dart';

class APIService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ConnectionConfig.API_URL;
    var box = Hive.box("db");
    var token = box.get("userToken");
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = "Application/json";
      return request;
    });
    if (token != null) {
      httpClient.addRequestModifier((Request request) {
        request.headers['Authorization'] = "Bearer $token";
        return request;
      });
    }
    httpClient.followRedirects = true;
    httpClient.maxRedirects = 5;
    super.onInit();
  }
}