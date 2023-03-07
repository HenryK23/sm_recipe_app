import 'package:connectivity_plus/connectivity_plus.dart';

class DeviceConnection {
  static Future<ConnectivityResult> get status =>
      (Connectivity().checkConnectivity());
}
