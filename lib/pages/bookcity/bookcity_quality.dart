/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-10 17:38:44
 */

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/components/novel_item_column.dart';
import 'package:app/routers.dart';

class BookCityQuality extends StatefulWidget {
  BookCityQuality({
    Key key,
    this.dataSource
  }) : super(key: key);
  final List dataSource;
  
  @override
  _BookCityQualityState createState() => _BookCityQualityState();
}

class _BookCityQualityState extends State<BookCityQuality> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onChangeTap() {
    setState(() {
      _currentIndex = _currentIndex < (widget.dataSource.length/6).ceil()-1 ? _currentIndex + 1 : 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '精品汇聚',
      toolBar: Container(
        child: GestureDetector(
          onTap: _onChangeTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.refresh,
                size: 18.0,
                color: Colors.black54,
              ),
              Text(
                '换一换',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  height: 0.9,
                ),
              )
            ],
          ),
        )
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0, left: 15.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 15.0,
          children: List<Widget>.generate(6, (index) {
            Map _item = widget.dataSource[index + _currentIndex*6];
              String _img = _item['imgjs'] != null ? json.decode(_item['imgjs'])[0]['url'] : _item['img'];
            return InkWell(
              onTap: () {
                Router.push(context, Router.bookdetailPage, { 'bookId': _item['bookid'] });
              },
              child: NovelItemColumn(
                title: _item['bookname'],
                img: _img,
                subtitle: _item['author'],
              )
            );
          }),
        ),
      )
    );
  }
}