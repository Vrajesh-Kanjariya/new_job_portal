import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../routes/app_navigation.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();

  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  bool isConnected = true;

  Future<bool> isConnectNetworkWithMessage() async {
    isConnected = await internetConnectionChecker.hasConnection;
    if (!isConnected) gotoInternet();
    return isConnected;
  }
}
