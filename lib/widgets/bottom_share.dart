/*
 * @Author: Rongj
 * @Date: 2019-07-09 16:29:45
 * @LastEditTime: 2019-07-09 20:30:38
 */

import 'package:flutter/material.dart';

class BottomShare {
  static showShareSheet(BuildContext context) {
    final List<Map> _shareList = [
      {
        'icon': IconData(0xe686, fontFamily: 'iconfont'),
        'color': Colors.blueAccent,
        'title': '微信',
      },
      {
        'icon': IconData(0xe62a, fontFamily: 'iconfont'),
        'color': Colors.orangeAccent,
        'title': '朋友圈',
      },
      {
        'icon': IconData(0xe699, fontFamily: 'iconfont'),
        'color': Colors.redAccent,
        'title': '微博',
      },
      {
        'icon': IconData(0xe612, fontFamily: 'iconfont'),
        'color': Colors.lightGreen,
        'title': 'QQ',
      },
      {
        'icon': IconData(0xe63e, fontFamily: 'iconfont'),
        'color': Colors.lightBlueAccent,
        'title': 'QQ空间',
      },
    ];

    handleShare(String title) {
      print('$title');
      // final _snackBar = SnackBar(
      //   content: Text('分享到$title'),
      //   backgroundColor: Colors.lightBlueAccent,
      //   duration: Duration(milliseconds: 1000),
      // );
      // Scaffold.of(context).showSnackBar(_snackBar);
    }

    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 170.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 96.0,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _shareList.length,
                itemBuilder: (BuildContext context, int index) {
                  Map item = _shareList[index];
                  return Container(
                    width: (MediaQuery.of(context).size.width - 30) / 5,
                    child: InkWell(
                      onTap: () => handleShare(item['title']),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Container(
                              width: 56.0,
                              height: 56.0,
                              color: item['color'],
                              child: Icon(
                                item['icon'],
                                color: Colors.white,
                                size: 28.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(item['title'],
                              style: TextStyle(color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    )
                  );
                },
              ),
            ),
            Container(
              height: 44.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFe1e1e1), width: 0.5))
              ),
              child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('取消'),
              ),
            )
          ],
        ),
      ),
    );
  }
}