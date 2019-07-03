/*
 * @Author: Rongj
 * @Date: 2019-07-03 16:36:39
 * @LastEditTime: 2019-07-03 20:32:23
 */

import 'package:flutter/material.dart';

class MyMenus extends StatelessWidget {
  static final TextStyle _ts = const TextStyle(
    fontSize: 14.0,
    color: Colors.black45
  );
  
  final List<Map> _menus = [
    {
      'text': '邀请好友',
      'icon': IconData(0xe611, fontFamily: 'iconfont'),
      'addonAfter': Text('领300书币', style: _ts,),
    },
    {
      'text': '书币充值',
      'icon': IconData(0xe614, fontFamily: 'iconfont'),
      'addonAfter': Text('送30天VIP', style: _ts,),
    },
    {
      'text': 'VIP专区',
      'icon': IconData(0xe6ba, fontFamily: 'iconfont'),
      'addonAfter': Text('免费看小说', style: _ts,),
    },
    {
      'text': '游戏中心',
      'icon': IconData(0xe602, fontFamily: 'iconfont'),
      'addonAfter': Text('赚书币', style: _ts,),
    },
    {
      'text': '绑兑换码',
      'icon': IconData(0xe64e, fontFamily: 'iconfont'),
    },
    {
      'text': '阅读记录',
      'icon': IconData(0xe618, fontFamily: 'iconfont'),
    },
    {
      'text': '我的收藏',
      'icon': IconData(0xe61b, fontFamily: 'iconfont'),
    },
    {
      'text': '我的书评',
      'icon': IconData(0xe604, fontFamily: 'iconfont'),
    },
    {
      'text': '帮助与反馈',
      'icon': IconData(0xe616, fontFamily: 'iconfont'),
    },
    {
      'text': '设置',
      'icon': IconData(0xe60b, fontFamily: 'iconfont'),
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: _menus.map((item) {
          return Container(
            padding: EdgeInsets.only(left: 15.0),
            height: 50.0,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(item['icon'], size: 20.0,),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    padding: EdgeInsets.only(right: 5.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12, width: 0.8))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          item['text'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Row(
                          children: <Widget>[
                            item['addonAfter'] ?? null,
                            Icon(
                              IconData(0xe633, fontFamily: 'iconfont'),
                              color: Colors.black26,
                            )
                          ].where((Object o) => o != null).toList(),
                        )
                      ]
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),      
      // child: ListView.builder(
      //   itemCount: _menus.length,
      //   itemBuilder: (BuildContext context, int index) {
          
      //   }
      // ),
    );
  }
}