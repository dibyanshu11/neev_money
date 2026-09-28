import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  InternetChecker._();
  static final InternetChecker _instance = InternetChecker._();
  factory InternetChecker() => _instance;

  Future<bool> checkInternetConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    return !(result.length == 1 && result.contains(ConnectivityResult.none));
  }
}
