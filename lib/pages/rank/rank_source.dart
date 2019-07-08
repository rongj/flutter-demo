/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-08 19:58:22
 */

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class RankSource extends StatelessWidget {
  RankSource({
    Key key,
    this.dataSource
  }) : super(key : key);
  final List dataSource;

  Color renderBoxColor(int index) {
    switch(index) {
      case 0:
        return Colors.red;
        break;
      case 1:
        return Colors.redAccent;
        break;
      case 2:
        return Colors.deepOrangeAccent;
        break;
      default:
        return Colors.black54;
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.redAccent, width: 0.3)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(dataSource.length, (int index) {
            return buildItem(context, dataSource[index], index);
          })
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Map item, int index) {
    String img = item['imgjs'] != null ? json.decode(item['imgjs'])[0]['url'] : item['img'];
    return InkWell(
      onTap: () {
        Router.push(context, Router.bookdetailPage, { 'bookId': item['bookid'] });
      },
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
        margin: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFE1E1E1), width: 0.5)),
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 75.0,
                  height: 100.0,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE8E8E8), width: 0.5),
                    borderRadius: BorderRadius.circular(2.0),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                Positioned(
                  left: -4.0,
                  top: -7.0,
                  child: Icon(
                    IconData(0xe600, fontFamily: 'iconfont'),
                    color: renderBoxColor(index),
                    size: 28.0,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 14.0,
                    height: 14.0,
                    alignment: Alignment.center,
                    child: Text(
                      (index+1).toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item['bookname'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              item['desc'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13.0, color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      item['author'],
                      style: TextStyle(fontSize: 12.0, color: Colors.black54)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}