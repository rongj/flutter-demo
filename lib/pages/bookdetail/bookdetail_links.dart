/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:28:38
 * @LastEditTime: 2019-07-08 18:23:24
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class BookDetailLinks extends StatelessWidget {
  BookDetailLinks({
    Key key,
    this.detail
  }) : super(key: key);
  final Map detail;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){
              Router.push(context, Router.catalogPage, { 'bookId': detail['bookId'] });
            },
            color: Colors.white,
            child: Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Icon(IconData(0xe61a, fontFamily: 'iconfont'), color: Colors.lightBlueAccent, size: 18.0,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            detail['latestChapterTitle'],
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Text(
                            detail['updateTime'],
                            style: TextStyle(fontSize: 13.0, color: Colors.black45),
                          ),
                        ],
                      ),
                    )
                  ),
                  Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: (){},
            color: Colors.white,
            child: Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Icon(IconData(0xe670, fontFamily: 'iconfont'), color: Colors.orangeAccent, size: 18.0,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '福利中心，阅读小说，领各种福利',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )
                  ),
                  Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: (){},
            color: Colors.white,
            child: Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Icon(IconData(0xe67d, fontFamily: 'iconfont'), color: Colors.redAccent, size: 18.0,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '开通VIP，畅读各种包月专区小说',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )
                  ),
                  Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}