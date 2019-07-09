/*
 * @Author: Rongj
 * @Date: 2019-07-09 20:39:53
 * @LastEditTime: 2019-07-09 20:56:53
 */

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class NetworkState {
  static Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  
  static Future<void> getNetworkState() async {
    String _connectionStatus = 'Unknown';
    ConnectivityResult _result;
    try {
      _result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    print(_result);
    
    // var connectivityResult = await Connectivity().checkConnectivity();
    // print(ConnectivityResult);
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    // }
  }

  // static 
}