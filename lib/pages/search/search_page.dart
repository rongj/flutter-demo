/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-08 13:56:27
 */

import 'package:flutter/material.dart';
import 'search_header.dart';
import 'search_hot_category.dart';
import 'search_hot_book.dart';
import 'search_history.dart';
import 'package:app/services/api.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List _hotBooks = [];   // 推荐书单

  @override
  void initState() {
    super.initState();
    loadData();
  }
  
  loadData() async {
    List _res = await Api.getSearchList();
    setState(() {
      _hotBooks = _res;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
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
            SearchHotBook(dataSource: _hotBooks,),
            SearchHistory()
          ],
        ),
      ),
    );
  }
}

