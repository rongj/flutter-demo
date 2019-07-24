/*
 * @Author: Rongj
 * @Date: 2019-07-17 14:06:46
 * @LastEditTime: 2019-07-23 15:55:04
 */

import 'dart:async';
import 'package:connectivity/connectivity.dart';

class NativeUtil {
  static Connectivity _connectivity = Connectivity();
  // static StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static Future getConnectivityData() async {
    String connectivityType = 'Unknown';
    ConnectivityResult connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connectivityType = 'cellular';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connectivityType = 'wifi';
    }
    // var wifiBSSID = await _connectivity.getWifiBSSID();
    // var wifiIP = await _connectivity.getWifiIP();
    // var wifiName = await _connectivity.getWifiName();
    return connectivityType;
  }
}