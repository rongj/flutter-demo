/*
 * @Author: Rongj
 * @Date: 2019-06-20 10:22:02
 * @LastEditTime: 2019-06-24 18:30:58
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'pages/container.dart';

void main() {
  runApp(App());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContainerPage(),
      theme: ThemeData(
        backgroundColor: Color(0xFFFEFEFE),
        primaryColor: Color(0xFF13c4d1),
        secondaryHeaderColor: Color(0xFFF2F2F2)
      ),
    );
  }
}