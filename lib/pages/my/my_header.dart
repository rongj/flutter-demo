/*
 * @Author: Rongj
 * @Date: 2019-07-03 15:06:03
 * @LastEditTime: 2019-07-09 20:24:34
 */

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/widgets/custom_refresh_indicator.dart';
import 'my_header_avatar.dart';
import 'my_header_info.dart';

class MyHeader extends StatelessWidget {
  MyHeader({
    Key key,
    this.fixed,
    this.info,
    this.lastRefreshTime
  }): super(key: key);
  
  final info;
  final bool fixed;
  final DateTime lastRefreshTime;
  
  @override
  Widget build(BuildContext context) {
    double _dragOffset = info?.dragOffset ?? 0.0;
    double _spinOffset =  _dragOffset - 32 > 40.0 ? 40.0 :  _dragOffset - 32;
    DateTime _time = lastRefreshTime ?? DateTime.now();
    String _refresText = '上次更新：' + DateFormat("yyyy-MM-dd HH:mm:ss").format(_time);
    if (info?.mode == RefreshIndicatorMode.armed) {
      _refresText = "释放刷新";
    } else if ((info?.mode == RefreshIndicatorMode.refresh ||
        info?.mode == RefreshIndicatorMode.snap)) {
      _refresText = "更新中...";
      _spinOffset = 40.0;
      _dragOffset = 60.0;
    } else if (info?.mode == RefreshIndicatorMode.done) {
      _refresText = "刷新完成";
    } else if (info?.mode == RefreshIndicatorMode.drag) {
      _refresText = "下拉刷新";
    } else if (info?.mode == RefreshIndicatorMode.canceled) {
      _refresText = "取消刷新";
    }

    return SliverAppBar(
      pinned: true,
      title: Text(fixed ? '我的' : ''),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.3,
      expandedHeight: 220.0 + _dragOffset,
      actionsIconTheme: fixed ? null : IconThemeData(color: Colors.white),
      iconTheme: fixed ? null : IconThemeData(color: Colors.white),
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData(0xe720, fontFamily: 'iconfont')),
          tooltip: '消息',
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
              top: _spinOffset,
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
                      _refresText,
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