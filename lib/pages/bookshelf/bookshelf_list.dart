/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-09 10:50:53
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_item_column.dart';
import 'package:app/components/loading.dart';
import 'package:app/services/mock.dart';
import 'package:app/routers.dart';

class BookShelfList extends StatefulWidget {
  @override
  _BookShelfListState createState() => _BookShelfListState();
}

class _BookShelfListState extends State<BookShelfList> {
  List _novelData = [];
  bool showCheck = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List res = await MockData.getBookshelfList();
    if(!mounted) {
      return;
    }
    setState(() {
      _novelData = res;
    });
  }

  // 长按多选
  _onLongPress() {
    this.setState(() {
      showCheck = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: _novelData.length > 0 ? Wrap(
        spacing: 20.0,
        runSpacing: 15.0,
        children: _bookList(),
      ) : Loading()
    );
  }

  List<Widget> _bookList() => List.generate(_novelData.length + 1, (index) {
    if(index < _novelData.length) {
      return InkWell(
        onTap: () {
          Router.push(context, Router.bookdetailPage, { 'bookId': _novelData[index]['bookid'] });
        },
        onLongPress: _onLongPress,
        child: NovelItemColumn(
          title: _novelData[index]['bookname'],
          img: _novelData[index]['img'],
          // subtitle: _novelData[index]['author'],
          showRecommend: index < 3,
          ableCheck: showCheck && index >= 3
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          //   return BookCityPage();
          // }));
        },
        child: NovelItemColumn(showAdd: true),
      );
    }
  });
}