/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-08 19:58:22
 */

import 'package:flutter/material.dart';
import 'category_detail_filter.dart';
import 'category_detail_list.dart';

class CategoryDetailPage extends StatefulWidget {
  CategoryDetailPage({
    Key key,
    this.title,
    this.gender,
    this.type
  }): super(key: key);
  final String title;
  final String gender;
  final String type;
  
  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CategoryDetailFilter(),
            CategoryDetailList(),
          ],
        ),
      ),
    );
  }
}