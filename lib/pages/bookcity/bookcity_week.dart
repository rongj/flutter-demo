/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-08 11:12:15
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_items_carousel.dart';

class BookCityWeek extends StatelessWidget {
  BookCityWeek({
    Key key,
    this.dataSource
  }) : super(key : key);

  final List dataSource;
  
  @override
  Widget build(BuildContext context) {
    return NovelItemsCarousel(
      title: '一周最热',
      dataSource: dataSource
    );
  }
}