/*
 * @Author: Rongj
 * @Date: 2019-07-10 12:49:29
 * @LastEditTime: 2019-07-16 21:01:46
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
  'white' : {
    'dark': false,
    'primaryColor': Colors.white,
  },
  'black' : {
    'dark': true,
    'primaryColor': Colors.black,
    'backgroundColor': Colors.grey,
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
  'orangeAccent' : {
    'dark': true,
    'primaryColor': Colors.orangeAccent,
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
  // static Map _item;
  // ThemeConfig({String colorType}) {
  //   _item = themeConfigs[colorType];
  // }
  // static bool isDark = _item['dark'] == null;
  // static Color primaryColor = _item['primaryColor'];

  
  // 主题配置
  // Color primaryColor, // 主色
  // scaffoldBackgroundColor, // 背景色
  // backgroundColor, // 面板背景色
  // iconColor,   // 图标颜色
  // iconFixedColor // appBar固定的颜色
  
  // ;

  // ThemeConfig([String colorType = 'primary']) {
  //   Map _item = themeConfigs[colorType];
  //   bool _isDark =  _item['dark'] == null;
  //   this.primaryColor = _item['primaryColor'];
  //   this.backgroundColor = _isDark ? _item['backgroundColor'] ?? Color(0xFFf2f2f2) : Color(0xFF333333);
  //   this.iconColor = _isDark ? Colors.white : Colors.black;
  // }
  
  static ThemeData defaultTheme([String colorType = 'primary']) {
    Map _item = themeConfigs[colorType];
    bool _isDark =  _item['dark'] == true;
    print(_item['backgroundColor'] ?? Color(0xFFf9f9f9));
    return ThemeData(
      primaryColor: _item['primaryColor'],
      backgroundColor: _isDark ? _item['backgroundColor'] ?? Color(0xFFf2f2f2) : Color(0xFF333333),
      scaffoldBackgroundColor: _item['backgroundColor'] ?? Color(0xFFf9f9f9),
      brightness: Brightness.light,
      // accentColor: Color(0xFFffffff),
      secondaryHeaderColor: Color(0xFFF2F2F2),
      buttonTheme: ButtonThemeData(
        minWidth: 60.0,
      ),
      // splashColor: Color(0x3313c4d1),
      unselectedWidgetColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0
      ),
      // platform: TargetPlatform.iOS
    );
  }
}