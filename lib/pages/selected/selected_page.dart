/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-28 15:32:11
 */


import 'package:flutter/material.dart';
import './selected_man.dart';
import './selected_woman.dart';

class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> with SingleTickerProviderStateMixin {
  ScrollController _controller;
  TabController _tabController;
  static List<String> _tabs = ['男生', '女生'];

  // bool _hideTabBar = false;
  // String _currentTabText = _tabs[0];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(() {
      // setState(() {
      //   _hideTabBar = _controller.offset > 300;
      // });
    });

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    )..addListener(() {
      setState(() {
        // _currentTabText = _tabs[_tabController.index];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  // 下拉刷新
  Future _pullToRefresh() async {

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('精选'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.3,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(36.0),
          child: Container(
            color: Theme.of(context).secondaryHeaderColor,
            height: 36.0,
            padding: EdgeInsets.symmetric(horizontal: 150.0),
            child: TabBar(
              controller: _tabController,
              labelStyle: TextStyle(fontSize: 16.0),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                // strokeCap: StrokeCap.round,
                insets: EdgeInsets.symmetric(horizontal: 8.0),
                borderSide: BorderSide(width: 2.0, color: Theme.of(context).primaryColor)
              ),
              tabs: _tabs.map((tab) => Tab(text: tab,)).toList(),
            )
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) => RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: ListView(
              controller: _controller,
              children: <Widget>[
                tab == '男生' ? SelectedMan() : SelectedWoman(),
              ],
            ),
          )
        ).toList(),
      )
    );
  }
}

