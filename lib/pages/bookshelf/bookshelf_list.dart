/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-06-25 17:16:45
 */

import 'package:flutter/material.dart';

class BookShelfList extends StatefulWidget {
  @override
  _BookShelfListState createState() => _BookShelfListState();
}

class _BookShelfListState extends State<BookShelfList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Wrap(
        spacing: 30.0, // gap between adjacent chips
        runSpacing: 20.0, // gap between lines
        children: _bookList(),
      )
    );
  }

  List<Widget> _bookList() => List.generate(9, (index) {
    var _boxWidth = (MediaQuery.of(context).size.width - 100) / 3;
    return Container(
      width: _boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  'http://images01.mopimg.cn/imgs/20171127/20171127_da3922a8cddf7a3b9e77a1e957e3ae34.jpg',
                  width: _boxWidth,
                  height: _boxWidth / 3 * 4,
                ),
              ),
              Positioned(
                right: 0,
                top: -1.0,
                child: Icon(
                  IconData(0xe637, fontFamily: 'iconfont'),
                  color: Colors.lightBlueAccent,
                  // color: Theme.of(context).primaryColor
                ),
              ),
            ],
          ),
          Container(
            height: 32,
            child: Text(
              '妖孽郎君别乱来',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 16.0,
              )
            )
          )
        ],
      ),
    );
  });
}