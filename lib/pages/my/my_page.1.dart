/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:35:16
 * @LastEditTime: 2019-06-28 16:03:14
 */

import 'package:flutter/material.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/components/carousel_banner.dart';
import '../bookcity/bookcity_week.dart';
import '../bookcity/bookcity_quality.dart';
import '../bookcity/bookcity_guess.dart';
import '../bookcity/bookcity_hot.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  static List<String> _tabs = ['推荐', '男生', '女生', '免费'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // 下拉刷新
  Future _pullToRefresh() async {

  }

  @override
  Widget build(BuildContext context) {
    double _bannerHeight = MediaQuery.of(context).size.width / 16 * 8;
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  pinned: true,
                  expandedHeight: _bannerHeight - 25,
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
                    child: TabBar(
                      controller: _tabController,
                      labelStyle: TextStyle(fontSize: 16.0),
                      labelColor: Theme.of(context).primaryColor,
                      labelPadding: EdgeInsets.all(0.0),
                      unselectedLabelColor: Colors.black87,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: UnderlineTabIndicator(
                        insets: EdgeInsets.symmetric(horizontal: 8.0),
                        borderSide: BorderSide(width: 2.0, color: Theme.of(context).primaryColor)
                      ),
                      tabs: _tabs.map((tab) => Tab(text: tab,)).toList(),
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.3,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CarouselBanner(
                      bannerHeight: _bannerHeight
                    )
                  ),
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
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: _tabs.map((tab) => RefreshIndicator(
              onRefresh: _pullToRefresh,
              child: Builder(
                builder: (context) => CustomScrollView(
                  key: PageStorageKey<String>(tab),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          BookCityWeek(),
                          BookCityQuality(),
                          BookCityGuess(),
                          BookCityHot(),
                        ],
                      ),
                    )
                  ]
                )
              ),
            )).toList(),
          ),
        ),
      )
    );
  }
}