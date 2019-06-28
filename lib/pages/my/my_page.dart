/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-28 18:12:14
 */


import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}


class _MyPageState extends State<MyPage> {
  String novelType;
  List novelList = List();
  ScrollController _controller = ScrollController();

  _MyPageState({ Key key }) {
    _controller.addListener(() {

    });
  }

  // 下拉刷新
  Future _pullToRefresh() async {

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.3,
      ),
      body: RefreshIndicator(
        onRefresh: _pullToRefresh,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Text('item$index'),
            );
          },
        ),
      ),
    );
  }
}
