/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-05 14:54:45
 */

import 'package:flutter/material.dart';
import '../rank/rank_page.dart';
import '../category/category_page.dart';

class BookCityNavs extends StatelessWidget {
  final List<Map> _navs = [
    {
      'icon': Icons.category,
      'color': Colors.blueAccent,
      'title': '分类',
      'page': CategoryPage()
    },
    {
      'icon': Icons.equalizer,
      'color': Colors.orangeAccent,
      'title': '榜单',
      'page': RankPage()
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

  final _snackBar = SnackBar(
    content: Text('Page not found!'),
    backgroundColor: Colors.lightBlueAccent,
    duration: Duration(milliseconds: 1000),
  );

  _handleNavTap(BuildContext context, item) {
    if(item['page'] != null) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return item['page'];
      }));
    } else {
      Scaffold.of(context).showSnackBar(_snackBar);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navs.map((f) {
          return InkWell(
            onTap: () => _handleNavTap(context, f),
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
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
              ),
            )
          );
        }).toList(),
      ),
    );
  }
}