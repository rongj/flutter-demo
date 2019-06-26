/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-06-26 17:05:27
 */

import 'package:flutter/material.dart';

class BookCityNavs extends StatelessWidget {
  final List<Map> _navs = const [
    {
      'icon': Icons.category,
      'color': Colors.blueAccent,
      'title': '分类',
    },
    {
      'icon': Icons.equalizer,
      'color': Colors.orangeAccent,
      'title': '榜单',
    },
    {
      'icon': Icons.star,
      'color': Colors.redAccent,
      'title': '会员',
    },
    {
      'icon': Icons.book,
      'color': Colors.lightGreen,
      'title': '新书',
    },
    {
      'icon': Icons.assignment_turned_in,
      'color': Colors.lightBlueAccent,
      'title': '完结',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navs.map((f) {
          return Column(
            children: <Widget>[
              ClipOval(
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  color: f['color'],
                  child: Icon(
                    f['icon'],
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(f['title'],
                  style: TextStyle(color: Colors.black87),
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}