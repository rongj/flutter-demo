/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:28:38
 * @LastEditTime: 2019-07-09 14:57:33
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
    return InkWell(
      onTap: () => setState(() => _showDetail = !_showDetail),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Text(
              widget.detail['desc'],
              style: TextStyle(fontSize: 15.0),
              maxLines: _showDetail ? 9 : 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: NovelTags(tags: widget.detail['tag'], colourful: false),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(IconData(_showDetail ? 0xe68e : 0xe68d, fontFamily: 'iconfont')),
                  iconSize: 14.0,
                  color: Colors.black54,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}