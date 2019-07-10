/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:43:04
 * @LastEditTime: 2019-07-10 09:42:41
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_item_cover.dart';

class NovelItemColumn extends StatelessWidget {
  NovelItemColumn({
    Key key,
    this.img,
    this.title,
    this.showRecommend = false,
    this.subtitle = '',
    this.showAdd = false,
    this.ableCheck = false,
    this.checked,
  }): super(key: key) {
    titleMaxLines = subtitle.isNotEmpty ? 1 : 2;
  }

  final String img;
  final String title;
  final bool showRecommend;
  final String subtitle;
  final bool showAdd;
  final bool ableCheck;
  final bool checked;
  int titleMaxLines = 2;
  bool notNull(Object o) => o != null;
  
  @override
  Widget build(BuildContext context) {
    double _boxWidth = (MediaQuery.of(context).size.width - 70.0) / 3;
    double _boxHeight = _boxWidth / 3 * 4;
    return showAdd ?
    Container(
      width: _boxWidth,
      height: _boxHeight,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE8E8E8), width: 0.5),
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xFFf7f7f7),
      ),
      child: Icon(
        IconData(0xe60d, fontFamily: 'iconfont'),
      ),
    ) :
    Container(
      width: _boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NovelItemCover(
            width: _boxWidth,
            height: _boxHeight,
            img: img,
            showRecommend: showRecommend,
            ableCheck: ableCheck,
            checked: checked,
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            height: 22.0 * titleMaxLines,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: titleMaxLines,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 16.0,
              )
            )
          ),
          subtitle.isNotEmpty ?
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
            )
          ) : null
        ].where(notNull).toList(),
      ),
    );
  }
}