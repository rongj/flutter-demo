/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:35:16
 * @LastEditTime: 2019-06-27 20:54:59
 */

import 'package:flutter/material.dart';
import '../bookcity/bookcity_week.dart';
import '../bookcity/bookcity_quality.dart';
import '../bookcity/bookcity_guess.dart';
import '../bookcity/bookcity_hot.dart';

class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tabs = [
    Tab(text: "男生"),
    Tab(text: "女生"),
  ];

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
                  title: Text('精选'),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.3,
                  bottom: TabBar(
                    tabs: _tabs.map((tab) => 
                      Text(
                        tab.text,
                        style: TextStyle(fontSize: 12.0)
                      )
                    ).toList()
                  ),
                  forceElevated: innerBoxIsScrolled,
                ),
              )
            ];
          },
          body: RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: TabBarView(
              controller: _tabController,
              children: _tabs.map((Tab tab) => Builder(
                builder: (context) => CustomScrollView(
                  key: PageStorageKey<String>(tab.text),
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
              )).toList(),
            ),
          ),
        ),
      )
    );
  }
}