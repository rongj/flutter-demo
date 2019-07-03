/*
 * @Author: Rongj
 * @Date: 2019-07-03 15:06:03
 * @LastEditTime: 2019-07-03 20:50:36
 */

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_header_avatar.dart';
import 'my_header_info.dart';

class MyHeader extends StatelessWidget {
  MyHeader({
    Key key,
    this.fixed,
    this.info
  }): super(key: key);
  
  final info;
  final bool fixed;
  
  @override
  Widget build(BuildContext context) {
    print(info?.mode);
    print(info?.dragOffset);
    var offset = info?.dragOffset ?? 0.0;

    return SliverAppBar(
      pinned: true,
      title: Text(fixed ? '我的' : ''),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.3,
      expandedHeight: 220.0 + offset,
      actionsIconTheme: fixed ? null : IconThemeData(color: Colors.white),
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData(0xe720, fontFamily: 'iconfont')),
          tooltip: '设置',
          onPressed: () {}
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              )
            ),
            Positioned(
              top: -40.0,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SpinKitThreeBounce(
                      color: Colors.white,
                      size: 20.0,
                    ),
                    Text(
                      '上次更新时间',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    MyHeaderAvatar(),
                    MyHeaderInfo()
                  ],
                ),
              )
              ),
          ],
        )
      )
    );
  }
}