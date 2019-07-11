/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 20:53:10
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';
import 'package:app/configs/theme.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/blocs/theme.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      key: Key('d'),
      stream: themeBloC.stream,
      initialData: themeBloC.value,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print(snapshot.data);
        return Scaffold(
          appBar: AppBar(
            title: Text('主题${snapshot.data}'),
            // title: Text('主题', style: TextStyle(color: snapshot.data.iconColor),),
            centerTitle: true,
            // backgroundColor: snapshot.data.primaryColor,
            // actionsIconTheme: IconThemeData(color: snapshot.data.iconColor),
            // iconTheme: IconThemeData(color: snapshot.data.iconColor),
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
                        children: ThemeConfig.themeList.map((Map item) {
                          return InkWell(
                            onTap: () => themeBloC.changeTheme(item['type']),
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              color: item['color'],
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
        );
      },
    );
  }
}