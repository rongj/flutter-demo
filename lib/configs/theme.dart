/*
 * @Author: Rongj
 * @Date: 2019-07-10 12:49:29
 * @LastEditTime: 2019-07-11 20:19:27
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
    'primaryColor': Color(0xFF13c4d1),
  },
  'white' : {
    'dark': false,
    'primaryColor': Colors.white,
  },
  'black' : {
    'primaryColor': Colors.black,
  },
  'redAccent' : {
    'primaryColor': Colors.redAccent,
  },
  'blueAccent' : {
    'primaryColor': Colors.blueAccent,
  },
  'greenAccent' : {
    'primaryColor': Colors.greenAccent,
  },
  'pinkAccent' : {
    'primaryColor': Colors.pinkAccent,
  },
  'purpleAccent' : {
    'primaryColor': Colors.purpleAccent,
  },
  'orangeAccent' : {
    'primaryColor': Colors.orangeAccent,
  },
  'amberAccent' : {
    'primaryColor': Colors.amberAccent,
  },
  'cyanAccent' : {
    'primaryColor': Colors.cyanAccent,
  },
};

// 主题配置
class ThemeConfig {
  // 主题配置
  Color primaryColor, // 主色
  scaffoldBackgroundColor, // 背景色
  backgroundColor, // 面板背景色
  iconColor,   // 图标颜色
  iconFixedColor // appBar固定的颜色
  
  ;
  ThemeConfig(String colorType) {
    Map _item = themeConfigs[colorType];
    bool _isDark =  _item['dark'] == null;
    print(_isDark);
    this.primaryColor = _item['primaryColor'];
    this.backgroundColor = _isDark ? _item['backgroundColor'] ?? Color(0xFFf2f2f2) : Color(0xFF333333);
    this.iconColor = _isDark ? Colors.white : Colors.black;
  }
  
  static ThemeData defaultTheme([Color primaryColor]) {
    return ThemeData(
      primaryColor: primaryColor != null ? primaryColor : Color(0xFF13c4d1),
      backgroundColor: Color(0xFFf2f2f2),
      scaffoldBackgroundColor: Color(0xFFf5f5f5),
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

  static List<Map> themeList = const [
    {
      'type': 'primary',
      'color': Color(0xFF13c4d1),
    },
    {
      'type': 'white',
      'color': Colors.white,
    },
    {
      'type': 'black',
      'color': Colors.black,
    },
    {
      'type': 'redAccent',
      'color': Colors.redAccent,
    },
    {
      'type': 'blueAccent',
      'color': Colors.blueAccent,
    },
    {
      'type': 'greenAccent',
      'color': Colors.greenAccent,
    },
    {
      'type': 'pinkAccent',
      'color': Colors.pinkAccent,
    },
    {
      'type': 'purpleAccent',
      'color': Colors.purpleAccent,
    },
    {
      'type': 'orangeAccent',
      'color': Colors.orangeAccent,
    },
    {
      'type': 'amberAccent',
      'color': Colors.amberAccent,
    },
    {
      'type': 'cyanAccent',
      'color': Colors.cyanAccent,
    },
  ];
}