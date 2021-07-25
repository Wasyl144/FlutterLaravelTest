import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:laraveltest/app/config/config_connection.dart';

class APIService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ConnectionConfig.API_URL;
    // httpClient.addRequestModifier((Request request) {
    //   request.headers['Authorization'] = "Bearer 3cd5ab0a98d2a9b470ece79e7a483e";
    //   return request;
    // });
    super.onInit();
  }
}