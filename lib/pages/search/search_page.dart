/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-02 10:53:00
 */

import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('search'),
//       ),
//     );
//   }
// }

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _controller;
  int _count = 10;
  bool _isLoding = false;
  bool _isRefreshing = false;
  String loadingText = "加载中.....";

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.depth == 0 &&
                  !_isLoding &&
                  !_isRefreshing) {
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
                  setState(() {
                    _isLoding = true;
                    loadingText = "加载中.....";
                    _count += 10;
                  });
                  _RrefreshPull().then((value) {
                    print('加载成功.............');
                    setState(() {
                      _isLoding = false;
                    });
                  }).catchError((error) {
                    print('failed');
                    setState(() {
                      _isLoding = true;
                      loadingText = "加载失败.....";
                    });
                  });
                }
              }
            },
            child: RefreshIndicator(
              child: CustomScrollView(
                controller: _controller,
                physics: ScrollPhysics(),
                slivers: <Widget>[
                  const SliverAppBar(
                    pinned: true,
                    title: Text('搜索'),
                    elevation: 0.0,
                    leading: Icon(Icons.arrow_back),
                  ),
           
                  SliverToBoxAdapter(
                    child: Visibility(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Center(
                          child: Text(loadingText),
                        ),
                      ),
                      visible: _isLoding,
                    ),
                  ),
                ],
              ),
              onRefresh: () {
                if (_isLoding) return null;
                return _RrefreshPull().then((value) {
                  print('success');
                  setState(() {
                    _count += 10;
                  });
                }).catchError((error) {
                  print('failed');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _RrefreshPull() async {
    await Future.delayed(Duration(seconds: 3));
    return "_RrefreshPull";
  }
}
