/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:42:07
 * @LastEditTime: 2019-06-28 17:25:14
 */

import 'package:flutter/material.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/components/carousel_banner.dart';

class BookCityHeader extends StatefulWidget {
  BookCityHeader({
    Key key,
    this.tabs,
    this.fixed,
    this.tabController,
    this.onRefresh
  }): super(key: key);
  final List<String> tabs;
  final bool fixed;
  final TabController tabController;
  final Function onRefresh;

  @override
  _BookCityHeaderState createState() => _BookCityHeaderState();
}

class _BookCityHeaderState extends State<BookCityHeader> {
  // double _pullHeight;


  @override
  void initState() {
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    double _bannerHeight = MediaQuery.of(context).size.width / 16 * 8;
    return SliverAppBar(
      pinned: true,
      expandedHeight: _bannerHeight - 25,
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselBanner(
          bannerHeight: _bannerHeight
        )
      ),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
        child: TabBar(
          controller: widget.tabController,
          labelStyle: TextStyle(fontSize: 16.0),
          labelColor: widget.fixed ? Theme.of(context).primaryColor : Colors.white,
          labelPadding: EdgeInsets.all(0.0),
          unselectedLabelColor: widget.fixed ? Colors.black87 : Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 8.0),
            borderSide: BorderSide(
              width: 2.0,
              color: widget.fixed ? Theme.of(context).primaryColor : Colors.white
            )
          ),
          tabs: widget.tabs.map((tab) => Tab(text: tab,)).toList(),
        ),
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
      ],
    );
  }
}
