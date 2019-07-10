/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-10 17:59:37
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';
import 'package:app/configs/theme.dart';
import 'package:app/components/plate_layout.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  ThemeData _theme = ThemeConfig.defaultTheme();
  _onThemeChange(Color item) {
    print(item);
    setState(() {
      _theme = ThemeConfig.defaultTheme(item);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('主题'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {
                Router.push(context, Router.searchPage);
              }
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                PlateLayout(
                  title: '主题切换',
                  body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: ThemeConfig.themeList.map((Color item) {
                        return InkWell(
                          onTap: () => _onThemeChange(item),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            color: item,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}