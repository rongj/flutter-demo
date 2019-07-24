/*
 * @Author: Rongj
 * @Date: 2019-06-20 10:22:02
 * @LastEditTime: 2019-07-23 17:23:39
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:app/configs/theme.dart';
import 'package:app/blocs/bloc_index.dart';
// import 'package:app/pages/splash/splash_page.dart';
import 'package:app/pages/container.dart';
import 'package:app/utils/sp_utils.dart';
import 'package:app/configs/constant.dart';

void main() {
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
  String _themeType = ThemeConfig.defaultThemeType;

  @override
  void initState() {
    super.initState();
    SpUtil.instance.getString(Constant.THEME_TYPE, ThemeConfig.defaultThemeType).then((String value) {
      setState(() {
        _themeType = value;
      });
    });
    _initListener();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.themeStream.listen((value) {
      SpUtil.instance.setString(Constant.THEME_TYPE, value);
      setState(() {
        _themeType = value;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ContainerPage(),
      // home: SplashPage(),
      theme: ThemeConfig.defaultTheme(_themeType),
    );
  }
}