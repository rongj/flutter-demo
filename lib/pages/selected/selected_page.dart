/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-10 15:40:08
 */

import 'package:flutter/material.dart';
import 'selected_list.dart';
import 'package:app/components/loading.dart';
import 'package:app/services/api.dart';

class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> with SingleTickerProviderStateMixin {
  ScrollController _controller;
  TabController _tabController;
  List<Map> _tabs = [
    {
      'text': '男生',
      'value': 'man'
    },
    {
      'text': '女生',
      'value': 'woman'
    },
  ];

  String _currentGender = 'man';
  List _manList = [];
  List _womanList = [];

  @override
  void initState() {
    super.initState();
    loadData();
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
        _currentGender = _tabs[_tabController.index]['value'];
      });
      loadData();
    });
  }

  loadData() async {
    var _res = await Api.getChannelBookList({ 'gender': _currentGender });
    if(_currentGender == 'man') {
      setState(() {
        _manList = _res['data'];
      });
    } else if(_currentGender == 'woman') {
      setState(() {
        _womanList = _res['data'];
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  // 下拉刷新
  Future _pullToRefresh() async {
    loadData();
  }
  
  @override
  Widget build(BuildContext context) {
    bool _isEmptyList = (_currentGender == 'man' && _manList.length == 0) || (_currentGender == 'woman' && _womanList.length == 0);
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
                insets: EdgeInsets.symmetric(horizontal: 8.0),
                borderSide: BorderSide(width: 2.0, color: Theme.of(context).primaryColor)
              ),
              tabs: _tabs.map((tab) => Tab(text: tab['text'],)).toList(),
            )
          ),
        ),
      ),
      body: _isEmptyList ? Loading() : TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) => RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: ListView(
              controller: _controller,
              children: <Widget>[
                SelectedList(dataSource: tab['value'] == 'man' ? _manList : _womanList,)
              ],
            ),
          )
        ).toList(),
      )
    );
  }
}

