/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:43:04
 * @LastEditTime: 2019-06-27 19:55:53
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_tags.dart';
import 'package:app/components/novel_item_cover.dart';

class NovelItemRow extends StatelessWidget {
  NovelItemRow({
    Key key,
    this.img,
    this.title,
    this.desc,
    this.author,
    this.tag,
    this.status,
    this.showRecommend = false,
  }): super(key: key);

  final String img;
  final String title;
  final String desc;
  final String author;
  final String tag;
  final String status;
  final bool showRecommend;
  bool notNull(Object o) => o != null;

  @override
  Widget build(BuildContext context) {
    double _boxWidth = (MediaQuery.of(context).size.width - 70.0) / 3;
    double _boxHeight = _boxWidth / 3 * 4;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NovelItemCover(
            width: _boxWidth,
            height: _boxHeight,
            img: img,
            showRecommend: showRecommend
          ),
          Expanded(
            child: Container(
              height: _boxHeight,
              margin: EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              fontSize: 18.0,
                            )
                          ),
                        ),
                        NovelTags(tags: tag),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          height: 22.0 * 3,
                          child: Text(
                            desc,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        author,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.0,
                        )
                      ),
                      Container(
                        child: Text(
                          status == '1' ? '已完结' : '连载中',
                          style: TextStyle(
                            color: status == '1' ? Colors.deepOrange : Colors.green,
                            fontSize: 14.0,
                          )
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}