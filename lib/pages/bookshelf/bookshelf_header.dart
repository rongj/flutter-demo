/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-06-26 11:12:56
 */

import 'package:flutter/material.dart';
import 'package:app/pages/search/search_page.dart';

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
// class BookShelfHeader extends StatelessWidget {
//   final fixed;
//   BookShelfHeader({ Key key, this.fixed: false }) : super(key: key);
  
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
      elevation: 0.3,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return SearchPage();
            }));
          }
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          tooltip: '更多',
          onPressed: () => {}
        ),
      ],
    );
  }
}