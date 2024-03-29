/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-19 18:27:17
 */

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:app/components/appbar_menu.dart';
import 'package:app/routers.dart';
import 'package:app/widgets/custom_sliver_appbar.dart';

class BookShelfHeader extends StatelessWidget {
  BookShelfHeader({
    Key key,
    this.fixed,
    this.showCheck,
    this.onCheckCancel,
  }): super(key: key);
  final bool fixed;
  final bool showCheck;
  final Function onCheckCancel;

  _onMenuTap(String action) {
    print('你点了$action');
  }

  Widget _buildEmptyShelf(BuildContext context, double height) {
    return Positioned(
      top: height / 2,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Icon(
              IconData(0xe603, fontFamily: 'iconfont'),
              color: Colors.white,
              size: 40.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                '最近阅读的书会放在这里',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSpaceBar(BuildContext context, double height) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC00315f),
                Theme.of(context).primaryColor,
              ],
            )
          ),
        ),
        WaveWidget(
          config: CustomConfig(
            colors: [
              Colors.white,
              Colors.white54,
              Colors.white30,
              Colors.white24,
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.90, 0.87, 0.85, 0.8],
          ),
          waveAmplitude: 0,
          size: Size(
              double.infinity,
              double.infinity,
          ),
        ),
        _buildEmptyShelf(context, height)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double _bannerHeight = (MediaQuery.of(context).size.width / 16 * 8) - 25;
    return CustomSliverAppBar(
      fixed: fixed,
      expandedHeight: _bannerHeight,
      spaceBar: _buildSpaceBar(context, _bannerHeight),
      title: '书架',
      actions: showCheck ? <Widget>[
        FlatButton(
          onPressed: () => onCheckCancel(),
          child: Text('取消', style: TextStyle(color: fixed ? null : Colors.white),),
        )
      ] : <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: () {
            Router.push(context, Router.searchPage);
          }
        ),
        AppBarMenu(
          menus: [
            {
              'key': 'setting',
              'text': '书架管理',
              'icon': Icons.message
            },
            {
              'key': 'sync',
              'text': '云端同步',
              'icon': Icons.group_add
            },
          ],
          onTap: _onMenuTap
        )
      ],
    );
  }
}