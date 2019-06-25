/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-25 14:37:34
 */


import 'package:flutter/material.dart';

class BookCityPage extends StatefulWidget {
  @override
  _BookCityPageState createState() => _BookCityPageState();
}

class _BookCityPageState extends State<BookCityPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fixedAppBar = _controller.offset > 120;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double _bannerHeight = MediaQuery.of(context).size.width / 16 * 7;
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: _bannerHeight,
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
                          Icons.library_books,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        Text(
                          '最近阅读的书会放在这里',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
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
            _fixedAppBar ? '书架' : '',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: _fixedAppBar ? Theme.of(context).primaryColor : Colors.transparent,
          actionsIconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () => {}
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: '更多',
              onPressed: () => {}
            ),
          ],
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}