/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:43:04
 * @LastEditTime: 2019-06-26 19:48:56
 */

import 'package:flutter/material.dart';

class NovelItem extends StatelessWidget {
  NovelItem({
    Key key,
    this.img,
    this.title,
    this.showRecommend = false,
    this.subtitle = '',
    this.showAdd = false,
  }): super(key: key) {
    titleMaxLines = subtitle.isNotEmpty ? 1 : 2;
  }

  final String img;
  final String title;
  final bool showRecommend;
  final String subtitle;
  final bool showAdd;
  int titleMaxLines = 2;
  bool notNull(Object o) => o != null;
  
  @override
  Widget build(BuildContext context) {
    var _boxWidth = (MediaQuery.of(context).size.width - 100) / 3;
    return showAdd ?
    Container(
      width: _boxWidth,
      height: _boxWidth / 3 * 4,
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
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  img,
                  width: _boxWidth,
                  height: _boxWidth / 3 * 4,
                ),
              ),
              showRecommend ? 
              Positioned(
                right: 0,
                top: -1.0,
                child: Icon(
                  IconData(0xe637, fontFamily: 'iconfont'),
                  color: Colors.lightBlueAccent,
                ),
              ) : null
            ].where(notNull).toList(),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            height: 22.0 * titleMaxLines,
            // color: Colors.blueAccent,
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