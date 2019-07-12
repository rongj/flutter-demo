/*
 * @Author: Rongj
 * @Date: 2019-07-11 18:12:13
 * @LastEditTime: 2019-07-12 11:36:03
 */

import 'dart:async';
import 'package:app/configs/theme.dart';

/* 主题配置 */
class ThemeBLoC {
  // String _themeType = 'primary';

  // var _themeController = StreamController<String>.broadcast();
  
  // Stream<String> get stream => _themeController.stream;
  // // ThemeConfig get value => ThemeConfig(_themeType);
  // String get value => _themeType;

  // void changeTheme(_themeType) {
  //   return _themeController.sink.add(_themeType);
  //   // return _themeController.sink.add(_themeType);
  // }

  // void dispose() => _themeController.close();

  String _count = 'primary';
  var _countController = StreamController<String>.broadcast();

  Stream<String> get stream => _countController.stream;
  String get value => _count;

  changeTheme(type) {
    _countController.sink.add(type);
  }

  // StreamSubscription subscription = _countController.stream.listen((data) {
  //   print("data")
  // });

  dispose() {
    _countController.close();
  }
}

ThemeBLoC themeBloC = ThemeBLoC();