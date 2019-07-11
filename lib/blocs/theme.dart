/*
 * @Author: Rongj
 * @Date: 2019-07-11 18:12:13
 * @LastEditTime: 2019-07-11 20:10:17
 */

import 'dart:async';
import 'package:app/configs/theme.dart';

/* 主题配置 */
class ThemeBLoC {
  String _themeType = 'primary';

  var _themeController = StreamController<ThemeConfig>.broadcast();
  
  Stream<ThemeConfig>  get stream => _themeController.stream;
  ThemeConfig get value => ThemeConfig(_themeType);
  // String get value => _themeType;

  void changeTheme(_themeType) {
    print(_themeType);
    return _themeController.sink.add(ThemeConfig(_themeType));
    // return _themeController.sink.add(_themeType);
  }

  void dispose() => _themeController.close();
  
  // int _count = 0;
  // var _countController = StreamController<int>.broadcast();

  // Stream<int> get stream => _countController.stream;
  // int get value => _count;

  // increment() {
  //   _countController.sink.add(++_count);
  // }

  // dispose() {
  //   _countController.close();
  // }
}

ThemeBLoC themeBLoC = ThemeBLoC();