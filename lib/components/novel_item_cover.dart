/*
 * @Author: Rongj
 * @Date: 2019-06-27 15:16:02
 * @LastEditTime: 2019-07-09 14:01:49
 */

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NovelItemCover extends StatelessWidget {
  NovelItemCover({
    Key key,
    this.width,
    this.height,
    this.img,
    this.showRecommend = false,
    this.ableCheck = false
  }): super(key: key);

  final double width;
  final double height;
  final String img;
  final bool showRecommend;
  final bool ableCheck;
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
          child: FadeInImage.assetNetwork(
            image: img,
            placeholder: 'assets/images/timg.gif',
            fit: BoxFit.cover,
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
        ) : null,
        ableCheck ? 
        Positioned(
          top: 0,
          left: 0,
          child: Opacity(
            opacity: 0.4,
            child: Container(
              width: width,
              height: height,
              color: Colors.black,
            ),
          )
        ) : null,
        ableCheck ? 
        Positioned(
          bottom: -10.0,
          right: -10.0,
          child: Checkbox(
            value: true,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (bool val) => {},
          )
        ) : null,
      ].where(notNull).toList(),
    );
  }
}