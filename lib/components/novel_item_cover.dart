/*
 * @Author: Rongj
 * @Date: 2019-06-27 15:16:02
 * @LastEditTime: 2019-06-27 16:41:32
 */

import 'package:flutter/material.dart';

class NovelItemCover extends StatelessWidget {
  NovelItemCover({
    Key key,
    this.width,
    this.height,
    this.img,
    this.showRecommend
  }): super(key: key);

  final double width;
  final double height;
  final String img;
  final bool showRecommend;
  bool notNull(Object o) => o != null;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE8E8E8), width: 0.5),
            borderRadius: BorderRadius.circular(2.0),
            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.fill
            )
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
    );
  }
}