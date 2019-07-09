/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-08 19:58:22
 */

import 'package:flutter/material.dart';

class CategoryDetailFilter extends StatefulWidget {
  @override
  _CategoryDetailFilterState createState() => _CategoryDetailFilterState();
}

class _CategoryDetailFilterState extends State<CategoryDetailFilter> {

  final List _statusList = const [
    {
      'title' : '连载中',
      'code': '0',
    },
    {
      'title' : '已完结',
      'code': '1',
    },
  ];

  final List _wordsList = const [
    {
      'title' : '30万字以下',
      'code': '1',
    },
    {
      'title' : '30-50万字',
      'code': '2',
    },
    {
      'title' : '50-100万字',
      'code': '3',
    },
    {
      'title' : '100-200万字',
      'code': '4',
    },
    {
      'title' : '200万字以上',
      'code': '5',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlueAccent, width: 0.5))
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text('状态'),
                FlatButton(
                  onPressed: (){},
                  child: Text('已完结'),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text('连载中'),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text('字数'),
                FlatButton(
                  onPressed: (){},
                  child: Text('30万字以下'),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text('30-50万字'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}