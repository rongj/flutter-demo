/*
 * @Author: Rongj
 * @Date: 2019-07-10 12:49:29
 * @LastEditTime: 2019-07-18 16:52:22
 */

import 'package:flutter/material.dart';

// 透明度百分比 : 8位颜色值前两位
// 100% : FF
// 95% : F2
// 90% : E6
// 85% : D9
// 80% : CC
// 75% : BF
// 70% : B3
// 65% : A6
// 60% : 99
// 55% : 8C
// 50% : 80
// 45% : 73
// 40% : 66
// 35% : 59
// 30% : 4D
// 25% : 40
// 20% : 33
// 15% : 26
// 10% : 1A
// 5% : 0D
// 0% : 00

Map themeConfigs = {
  'primary' : {
    'dark': true,
    'primaryColor': Color(0xFF13c4d1),
  },
  'dark' : {
    'dark': true,
    'primaryColor': Color(0xFF3c3c3c),
    'backgroundColor': Colors.grey,
  },
  'black' : {
    'dark': true,
    'primaryColor': Colors.black,
    'primaryColorLight': Colors.black,
    'primaryColorDark': Colors.white
  },
  'redAccent' : {
    'dark': true,
    'primaryColor': Colors.redAccent,
  },
  'blueAccent' : {
    'dark': true,
    'primaryColor': Colors.blueAccent,
  },
  'greenAccent' : {
    'dark': false,
    'primaryColor': Colors.greenAccent,
  },
  'pinkAccent' : {
    'dark': true,
    'primaryColor': Colors.pinkAccent,
  },
  'purpleAccent' : {
    'dark': true,
    'primaryColor': Colors.purpleAccent,
  },
  'orange' : {
    'dark': true,
    'primaryColor': Colors.orange,
  },
  'amberAccent' : {
    'dark': false,
    'primaryColor': Colors.amberAccent,
  },
  'cyanAccent' : {
    'dark': false,
    'primaryColor': Colors.cyanAccent,
  },
};

// 主题配置
class ThemeConfig {
  static const String defaultThemeType = 'primary';
  
  static ThemeData defaultTheme([String colorType = defaultThemeType]) {
    Map _item = themeConfigs[colorType];
    bool _isDark =  _item['dark'] == true;
    var _isBlack = colorType == 'dark';
    ThemeData themeData = ThemeData(
      primaryColor: _item['primaryColor'],
      backgroundColor: _isDark ? _item['backgroundColor'] ?? Color(0xFFf2f2f2) : Color(0xFF333333),
      scaffoldBackgroundColor: _item['backgroundColor'] ?? Color(0xFFf9f9f9),
      primaryColorLight: _item['primaryColorLight'] ?? Colors.white,
      primaryColorDark: _item['primaryColorDark'] ?? Colors.black,
      brightness: _isBlack ? Brightness.dark : Brightness.light,
      primaryColorBrightness: _isDark ? Brightness.dark : Brightness.light,
      secondaryHeaderColor: Color(0xFFF2F2F2),
      buttonTheme: ButtonThemeData(
        minWidth: 60.0,
      ),
      // splashColor: Color(0x3313c4d1),
      unselectedWidgetColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
    );

    return themeData;
  }
}