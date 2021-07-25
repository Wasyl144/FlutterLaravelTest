import 'package:connectivity_plus/connectivity_plus.dart';
class ConnectionHelper {

  static bool checkConnection() {
    var connectivityResult = Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}