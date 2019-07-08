/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-08 19:52:43
 */

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/components/novel_item_row.dart';
import 'package:app/routers.dart';

class BookCityHot extends StatelessWidget {
  BookCityHot({
    Key key,
    this.dataSource
  }) : super(key : key);
  final List dataSource;

  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '热门小说',
      body: Container(
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
                status: _item['status'],
              )
            );
          }),
        ),
      )
    );
  }
}