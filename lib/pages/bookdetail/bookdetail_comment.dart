/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:28:38
 * @LastEditTime: 2019-07-05 09:38:11
 */

import 'package:flutter/material.dart';
import 'package:app/components/comment_item.dart';

class BookDetailComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 3.0, bottom: 5.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('书友评论', style: TextStyle(fontSize: 18.0),),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text('共404条评论', style: TextStyle(fontSize: 13.0, color: Colors.black45),),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: <Widget>[
                      Icon(IconData(0xe604, fontFamily: 'iconfont'), size: 15.0, color: Theme.of(context).primaryColor),
                      Text(' 写评论', style: TextStyle(fontSize: 15.0, color: Theme.of(context).primaryColor),)
                    ],
                  ),
                )
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                CommentItem(),
                CommentItem(),
                CommentItem(),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width - 40.0,
            child: FlatButton(
              onPressed: (){},
              child: Text('查看全部书评', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),),
            )
          )
        ],
      ),
    );
  }
}