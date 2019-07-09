/*
 * @Author: Rongj
 * @Date: 2019-06-20 10:22:02
 * @LastEditTime: 2019-07-08 18:15:37
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
// import 'package:device_info/device_info.dart';
import 'pages/container.dart';

void main() async {
  runApp(App());
  
  if (Platform.isAndroid) {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // print('Running on ${androidInfo.model}');
    
    //设置Android头部的导航栏透明
    // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 隐藏DEBUG字样
      title: 'Flutter Demo',
      home: ContainerPage(),
      theme: ThemeData(
        backgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFF13c4d1),
        secondaryHeaderColor: Color(0xFFF2F2F2)
      ),
    );
  }
}