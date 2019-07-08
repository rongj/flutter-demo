/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-08 13:46:03
 */


import 'package:flutter/material.dart';
import 'bookcity_header.dart';
import 'bookcity_navs.dart';
import 'bookcity_week.dart';
import 'bookcity_quality.dart';
import 'bookcity_guess.dart';
import 'bookcity_hot.dart';
import 'package:app/services/api.dart';
// import 'package:app/services/mock.dart';

class BookCityPage extends StatefulWidget {
  @override
  _BookCityPageState createState() => _BookCityPageState();
}

class _BookCityPageState extends State<BookCityPage> with SingleTickerProviderStateMixin {
  ScrollController _controller;
  TabController _tabController;
  static List<String> _tabs = ['推荐', '男生', '女生', '免费'];
  bool _fixedAppBar = false;
  
  List _weekDataSource = [];  // 本周热门
  List _guessDataSource = [];  // 猜你喜欢
  List _qualityDataSource = [];  // 精品汇聚
  List _hotDataSource = [];  // 热门推荐
  
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

    loadData();
  }

  loadData() async {
    if(!mounted) {
      return;
    }
    List _res = await Api.getWeekList();
    List _res2 = await Api.getGuessList();
    List _res3 = await Api.getQualityList();
    List _res4 = await Api.getHotList();
    setState(() {
      _weekDataSource = _res;
      _guessDataSource = _res2;
      _qualityDataSource = _res3;
      _hotDataSource = _res4;
    });
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
              BookCityWeek(dataSource: _weekDataSource),
              BookCityGuess(dataSource: _guessDataSource),
              BookCityQuality(dataSource: _qualityDataSource),
              BookCityHot(dataSource: _hotDataSource),
            ],
          )
        )
      ],
    );
  }
}