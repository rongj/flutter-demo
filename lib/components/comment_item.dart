/*
 * @Author: Rongj
 * @Date: 2019-06-27 17:24:18
 * @LastEditTime: 2019-07-09 15:14:44
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentItem extends StatelessWidget {
  CommentItem({
    Key key,
    this.username,
    this.userpic,
    this.content,
    this.score,
    this.datetime,
    this.replynum,
    this.praisenum,
  }): super(key: key);
  final String username;
  final String userpic;
  final String content;
  final String score;
  final String datetime;
  final int replynum;
  final int praisenum;

  @override
  Widget build(BuildContext context) {
    var _datetime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(int.parse(datetime)));
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 44.0,
            height: 44.0,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
              image: DecorationImage(
                image: NetworkImage(userpic),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Colors.white, width: 1.0)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(username, style: TextStyle(fontSize: 14.0, color: Colors.black87),),
                Row(
                  children: List.generate(5, (int index) {
                    return Icon(
                      IconData(0xe61b, fontFamily: 'iconfont'),
                      size: 15.0,
                      color: double.parse('4.5') > index ? Colors.orange : Colors.black45
                    );
                  }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(content, style: TextStyle(fontSize: 16.0),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_datetime, style: TextStyle(fontSize: 13.0, color: Colors.black54),),
                    Row(
                      children: <Widget>[
                        Container(
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(IconData(0xe605, fontFamily: 'iconfont'), size: 14.0),
                                Text(' ${replynum.toString()}', style: TextStyle(fontSize: 14.0, color: Colors.black54))
                              ],
                            )
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(IconData(0xe692, fontFamily: 'iconfont'), size: 14.0),
                                Text(' ${praisenum.toString()}', style: TextStyle(fontSize: 14.0, color: Colors.black54))
                              ],
                            )
                          )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}