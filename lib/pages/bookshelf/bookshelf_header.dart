/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-09 20:22:48
 */

import 'package:flutter/material.dart';
import 'package:app/components/appbar_menu.dart';
import 'package:app/routers.dart';

class BookShelfHeader extends StatefulWidget {
  BookShelfHeader({
    Key key,
    this.fixed
  }): super(key: key);
  final bool fixed;
  
  @override
  _BookShelfHeaderState createState() => _BookShelfHeaderState();
}

class _BookShelfHeaderState extends State<BookShelfHeader> {
  _onMenuTap(String action) {
    print('你点了$action');
  }
  
  @override
  Widget build(BuildContext context) {
    double _bannerHeight = MediaQuery.of(context).size.width / 16 * 8;
    return SliverAppBar(
      pinned: true,
      expandedHeight: _bannerHeight - 25,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/timg.jpg',
              width: MediaQuery.of(context).size.width,
              height: _bannerHeight,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: (_bannerHeight - 16) / 2,
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
            ),
          ],
        )
      ),
      title: Text(
        widget.fixed ? '书架' : '',
      ),
      centerTitle: true,
      backgroundColor: widget.fixed ? Colors.white : Colors.transparent,
      actionsIconTheme: widget.fixed ? null : IconThemeData(color: Colors.white),
      iconTheme: widget.fixed ? null : IconThemeData(color: Colors.white),
      elevation: 0.3,
      actions: <Widget>[
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