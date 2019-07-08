/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-08 20:00:41
 */

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/components/novel_item_column.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app/routers.dart';

class NovelItemsCarousel extends StatefulWidget {
  NovelItemsCarousel({
    Key key,
    this.title,
    this.dataSource
  }): super(key: key);

  final String title;
  final List dataSource;
  
  @override
  _NovelItemsCarouselState createState() => _NovelItemsCarouselState();
}

class _NovelItemsCarouselState extends State<NovelItemsCarousel> {
  int _currentIndex = 0;
  
  void _onIndexChanged(int index, int total) {
    setState(() {
      _currentIndex = index < total-1 ? _currentIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _boxWidth = (MediaQuery.of(context).size.width - 70.0) / 3;
    int _swiperNum = (widget.dataSource.length/3).ceil();
    return PlateLayout(
      title: widget.title,
      toolBar: Container(
        child: Row(
          children: List<Widget>.generate(_swiperNum, (index) {
            return Container(
              width: 10.0,
              height: index == _currentIndex ? 3.0 : 1.0,
              margin: EdgeInsets.only(left: 5.0),
              color: index == _currentIndex ? Theme.of(context).primaryColor : Colors.black12,
            );
          }),
        ),
      ),
      body: Container(
        height: _boxWidth / 3 * 4 + 52.0,
        margin: EdgeInsets.only(top: 15.0),
        child: widget.dataSource.length > 0 ? Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              spacing: 20.0,
              runSpacing: 15.0,
              children: List<Widget>.generate(3, (i) {
                Map _item = widget.dataSource[i + index*3];
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
            );
          },
          itemCount: _swiperNum,
          onIndexChanged: (int index) => _onIndexChanged(index, _swiperNum)
        ) : null,
      )
    );
  }
}