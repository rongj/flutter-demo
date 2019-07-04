/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:28:38
 * @LastEditTime: 2019-07-04 16:47:45
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_tags.dart';

class BookDetailInfo extends StatefulWidget {
  BookDetailInfo({
    Key key,
    this.detail
  }) : super(key: key);

  final Map detail;
  
  @override
  _BookDetailInfoState createState () => _BookDetailInfoState();
}

class _BookDetailInfoState extends State<BookDetailInfo> {
  bool _showDetail = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.detail['desc'],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: NovelTags(tags: widget.detail['tag'], colourful: false),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(IconData(0xe68d, fontFamily: 'iconfont')),
                iconSize: 14.0,
                color: Colors.black54,
              )
            ],
          )
        ],
      ),
    );
  }
}