/*
 * @Author: Rongj
 * @Date: 2019-07-05 11:56:29
 * @LastEditTime: 2019-07-05 13:42:02
 */

import 'package:flutter/material.dart';

class SearchHistory extends StatefulWidget {
  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final List<String> _historyWords = const [
    '言情', '我的床上有只鬼', 
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('历史搜索', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: _historyWords.map((item) {
                return Container(
                  height: 44.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child:InkWell(
                          onTap: (){},
                          child: Text(item, style: TextStyle(height: 44.0/24.0),),
                        ),
                      ),
                      Container(
                        width: 44.0,
                        child: FlatButton(
                          onPressed: (){},
                          child: Icon(
                            IconData(0xe61f, fontFamily: 'iconfont'),
                            size: 16.0,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          )
        ],
      )
    );
  }
}