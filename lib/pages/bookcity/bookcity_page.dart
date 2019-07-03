/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-02 09:36:01
 */


import 'package:flutter/material.dart';
import 'bookcity_header.dart';
import 'bookcity_navs.dart';
import 'bookcity_week.dart';
import 'bookcity_quality.dart';
import 'bookcity_guess.dart';
import 'bookcity_hot.dart';

class BookCityPage extends StatefulWidget {
  @override
  _BookCityPageState createState() => _BookCityPageState();
}

class _BookCityPageState extends State<BookCityPage> with SingleTickerProviderStateMixin {
  ScrollController _controller;
  TabController _tabController;
  static List<String> _tabs = ['推荐', '男生', '女生', '免费'];
  bool _fixedAppBar = false;

  // 下拉刷新
  Function _pullToRefresh;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(() {
      setState(() {
        _fixedAppBar = _controller.position.pixels > 130;
      });
      _pullToRefresh(_controller.position.pixels);
    });

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        BookCityHeader(
          fixed: _fixedAppBar,
          tabs: _tabs,
          tabController: _tabController,
          onRefresh: _pullToRefresh
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              BookCityNavs(),
              BookCityWeek(),
              BookCityGuess(),
              BookCityQuality(),
              BookCityHot(),
            ],
          )
        )
      ],
    );
  }
}