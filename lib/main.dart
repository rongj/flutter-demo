/*
 * @Author: Rongj
 * @Date: 2019-06-20 10:22:02
 * @LastEditTime: 2019-07-16 20:41:42
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:app/configs/theme.dart';
import 'package:app/pages/container.dart';
import 'package:app/blocs/bloc_index.dart';

void main() async {
  runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(
        bloc: MainBloc(),
        child: App(),
      ),
    )
  );
  
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
  String _themeType = 'primary';

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appStream.listen((value) {
      setState(() {
        _themeType = value;
      });
      // print(value);
      // print(ThemeConfig.primaryColor);
      // print(ThemeConfig.isDark);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 隐藏DEBUG字样
      title: 'Flutter Demo',
      home: ContainerPage(),
      theme: ThemeConfig.defaultTheme(_themeType),
    );
  }
}