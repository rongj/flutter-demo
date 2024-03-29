/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-09 16:08:17
 */

import 'package:flutter/material.dart';
import 'dart:convert' show json;

class BookDetailHeader extends StatelessWidget {
  BookDetailHeader({
    Key key,
    this.detail
  }): super(key: key);
  final Map detail;
  
  Widget buildBookTxt(Map detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          detail['bookName'],
          style: TextStyle(color: Colors.white, fontSize: 20.0, height: 1.2),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
          child: Row(
            children: <Widget>[
              Text(
                detail['bookAuthorName'],
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 1.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  color: Colors.white,
                ),
              ),
              Text(
                detail['auditStatus'] == '1' ? '连载中' : '已完结',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: ((int.parse(detail['bookWords'])/10000).ceil()).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                      ),
                      TextSpan(
                        text: '万字',
                        style: TextStyle(color: Colors.white, fontSize: 12.0)
                      ),
                    ]
                  )
                ),
                Text('连载', style: TextStyle(color: Colors.white, fontSize: 14.0),)
              ],
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: 1.0,
                height: 30.0,
                color: Colors.white,
              ),
            ),
            Column(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: ((detail['userCounts']/10000).ceil()).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                      ),
                      TextSpan(
                        text: '万',
                        style: TextStyle(color: Colors.white, fontSize: 12.0)
                      ),
                    ]
                  )
                ),
                Text('点击', style: TextStyle(color: Colors.white, fontSize: 14.0),)
              ],
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: 1.0,
                height: 30.0,
                color: Colors.white,
              ),
            ),
            Column(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: detail['replynum'].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0)
                      ),
                    ]
                  )
                ),
                Text('收藏', style: TextStyle(color: Colors.white, fontSize: 14.0),)
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget buildBookCover(Map detail) {
    return Container(
      width: 120.0,
      height: 160.0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE8E8E8), width: 0.5),
        borderRadius: BorderRadius.circular(2.0),
        image: DecorationImage(
          image: NetworkImage(json.decode(detail['bookPic'])[0]['url']),
          fit: BoxFit.fill
        )
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 160.0, right: 60.0),
            height: 120.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.lightBlueAccent[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: buildBookTxt(detail)
          ),
          Positioned(
            bottom: -20.0,
            left: 20.0,
            child: buildBookCover(detail),
          )
        ],
      ),
    );
  }
}