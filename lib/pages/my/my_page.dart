/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-04 10:21:34
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/widgets/custom_refresh_indicator.dart';
import 'my_header.dart';
import 'my_ad.dart';
import 'my_menus.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}


class _MyPageState extends State<MyPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(() {
      setState(() {
        _fixedAppBar = _controller.position.pixels > 130;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // 下拉刷新
  Future<bool> _pullToRefresh() async {
    final Completer<bool> completer = Completer<bool>();
    Timer(const Duration(seconds: 2), () {
      completer.complete(true);
    });
    return completer.future.then((bool success) {
      if (success) {
        print('refresh data');
        // setState(() {});
      }
      return success;
    });
  }
  
  @override
    Widget build(BuildContext context) {
    return PullToRefreshNotification(
      color: Colors.blue,
      maxDragOffset: 120.0,
      pullBackOnRefresh: true,
      onRefresh: _pullToRefresh,
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        slivers: <Widget>[
          PullToRefreshContainer((PullToRefreshScrollNotificationInfo info) => 
            MyHeader(
              info: info,
              fixed: _fixedAppBar
            )
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                MyAd(),
                MyMenus(),
                Container(
                  width: MediaQuery.of(context).size.width - 80.0,
                  height: 44.0,
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: FlatButton(
                    child: Text('退出'),
                    color: Colors.black12,
                    shape: StadiumBorder(),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
