/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-09 11:27:03
 */

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:app/routers.dart';
import 'package:app/components/novel_item_row.dart';

class CategoryDetailList extends StatelessWidget {
  CategoryDetailList({
    Key key,
    this.dataSource
  }): super(key: key);
  final List dataSource;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: List<Widget>.generate(dataSource.length, (index) {
          Map _item = dataSource[index];
          String _img = _item['imgjs'] != null ? json.decode(_item['imgjs'])[0]['url'] : _item['img'];
          return InkWell(
            onTap: () {
              Router.push(context, Router.bookdetailPage, { 'bookId': _item['bookid'] });
            },
            child: NovelItemRow(
              img: _img,
              title: _item['bookname'],
              desc: _item['desc'],
              author: _item['author'],
              tag: _item['tag'],
              status: _item['bookstatus'],
            )
          );
        }),
      ),
    );
  }
}