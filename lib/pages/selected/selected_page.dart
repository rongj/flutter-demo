/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-25 18:49:20
 */


import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}


class _SelectedPageState extends State<SelectedPage> {
  String novelType;
  List novelList = List();
  ScrollController _controller = ScrollController();

  _SelectedPageState({ Key key }) {
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
        title: Text('精选'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        // bottom: PreferredSize(
        //   child: Text('bottom'),
        //   preferredSize: Size(1, 1)
        // ),
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

