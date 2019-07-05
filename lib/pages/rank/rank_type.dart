/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:18
 * @LastEditTime: 2019-07-05 15:35:27
 */

import 'package:flutter/material.dart';

class RankType extends StatefulWidget {
  RankType({
    Key key,
    this.onTypeChange
  }) : super(key : key);
  final Function onTypeChange;
  
  @override
  _RankTypeState createState() => _RankTypeState();
}

class _RankTypeState extends State<RankType> {
  final List<Map> _rankTypes = const [
    {
      'type': 'hot',
      'text': '热门榜单'
    },
    {
      'type': 'full',
      'text': '全本榜单'
    },
    {
      'type': 'new',
      'text': '新书榜单'
    },
    {
      'type': 'sell',
      'text': '畅销榜单'
    },
    {
      'type': 'collect',
      'text': '收藏排行'
    },
    {
      'type': 'click',
      'text': '点击排行'
    },
  ];

  String _currentType = 'hot';

  _handleTypeChange(int index) {
    String _newType = _rankTypes[index]['type'];
    setState(() {
      _currentType = _newType;
    });
    widget.onTypeChange(_newType);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List<Widget>.generate(_rankTypes.length, (int index) {
            return InkWell(
              onTap: () => _handleTypeChange(index),
              child: Container(
                height: 44.0,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: _rankTypes[index]['type'] == _currentType ? Theme.of(context).primaryColor : Colors.transparent,
                      width: 3.0
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    _rankTypes[index]['text'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}