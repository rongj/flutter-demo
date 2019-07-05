/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-05 13:47:44
 */

import 'package:flutter/material.dart';
import 'search_header.dart';
import 'search_hot_category.dart';
import 'search_hot_book.dart';
import 'search_history.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchHeader(),
        backgroundColor: Colors.white,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            SearchHotCategory(),
            SearchHotBook(),
            SearchHistory()
          ],
        ),
      ),
    );
  }
}

