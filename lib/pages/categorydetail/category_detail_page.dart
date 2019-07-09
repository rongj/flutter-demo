/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-09 12:04:55
 */

import 'package:flutter/material.dart';
import 'category_detail_filter.dart';
import 'category_detail_list.dart';
import 'package:app/components/loading.dart';
import 'package:app/services/api.dart';

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
  List _novelData = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }
  
  handleFilterChange(status, size) {
    loadData(status, size);
    setState(() {
      _novelData = [];
    });
  }

  loadData([String status, String size]) async {
    setState(()  => _loading = true);
    var _res = await Api.getCategoryBookList({
      'categoryId': widget.type,
      'gender': widget.gender,
      'pageNo': 1,
      'pageSize': 20,
      'size': size,
      'status': status,
    });
    setState(() {
      _loading = false;
      _novelData = _res['data']['entityList'];
    });
  }

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
            CategoryDetailFilter(
              onChange: handleFilterChange
            ),
            _loading ? Loading() : CategoryDetailList(dataSource: _novelData,),
          ],
        ),
      ),
    );
  }
}