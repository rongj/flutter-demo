/*
 * @Author: Rongj
 * @Date: 2019-06-20 10:22:02
 * @LastEditTime: 2019-07-10 17:47:43
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'pages/container.dart';
import 'package:app/configs/theme.dart';

void main() async {
  runApp(App());
  
  if (Platform.isAndroid) {
    // 设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 隐藏DEBUG字样
      title: 'Flutter Demo',
      home: ContainerPage(),
      theme: ThemeConfig.defaultTheme(),
    );
  }
}