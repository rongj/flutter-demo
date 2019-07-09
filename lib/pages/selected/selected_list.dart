/*
 * @Author: Rongj
 * @Date: 2019-06-28 14:20:47
 * @LastEditTime: 2019-07-09 13:38:53
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_items_carousel.dart';

class SelectedList extends StatelessWidget {
  SelectedList({
    Key key,
    this.dataSource
  }): super(key: key);
  final List dataSource;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataSource.map((item) {
        return NovelItemsCarousel(
          title: item['name'],
          dataSource: item['books'],
        );
      }).toList()
    );
  }
}