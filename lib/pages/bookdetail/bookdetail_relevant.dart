/*
 * @Author: Rongj
 * @Date: 2019-06-28 14:20:47
 * @LastEditTime: 2019-07-09 14:14:04
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_items_carousel.dart';

class BookDetailRelevant extends StatelessWidget {
  BookDetailRelevant({
    Key key,
    this.dataSource
  }): super(key: key);
  final List dataSource;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NovelItemsCarousel(
          title: '为你推荐',
          dataSource: dataSource,
        ),
      ],
    );
  }
}