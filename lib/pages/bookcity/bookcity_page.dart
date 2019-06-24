/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-24 15:45:35
 */


import 'package:flutter/material.dart';

class BookCityPage extends StatefulWidget {
  @override
  _BookCityPageState createState() => _BookCityPageState();
}


class _BookCityPageState extends State<BookCityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('书城'),
            ),
          )
        ],
      ),
    );
  }
}