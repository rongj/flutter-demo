/*
 * @Author: Rongj
 * @Date: 2019-07-05 09:41:42
 * @LastEditTime: 2019-07-05 11:56:01
 */

import 'package:flutter/material.dart';

class SearchHotBook extends StatelessWidget {
  final List<Map> _hotbooks = const [
    {
      "bookHtml": "180626175124973927611.html",
      "bookId": "1530006684973927611",
      "bookName": "夜来女儿香",
      "bookType": "都市男",
      "bookTypeId": "1014"
    },
    {
      "bookHtml": "171127191134682939928.html",
      "bookId": "1511781094682939928",
      "bookName": "我的床上有只鬼",
      "bookType": "灵异女",
      "bookTypeId": "1025"
    },
    {
      "bookHtml": "180529102058418384226.html",
      "bookId": "1527560458418384226",
      "bookName": "武道大帝",
      "bookType": "玄幻男",
      "bookTypeId": "1010"
    },
    {
      "bookHtml": "180529103332116539660.html",
      "bookId": "1527561212116539660",
      "bookName": "帝君的小狂后",
      "bookType": "言情女",
      "bookTypeId": "1015"
    },
    {
      "bookHtml": "180621180125782714583.html",
      "bookId": "1529575285782714583",
      "bookName": "那夜，我做了",
      "bookType": "都市男",
      "bookTypeId": "1014"
    },
    {
      "bookHtml": "171127191207587561885.html",
      "bookId": "1511781127587561885",
      "bookName": "重生嫡女毒后",
      "bookType": "言情女",
      "bookTypeId": "1015"
    },
    {
      "bookHtml": "180518173628195441746.html",
      "bookId": "1526636188195441746",
      "bookName": "买一送一：嫁给亿万首席",
      "bookType": "言情女",
      "bookTypeId": "1015"
    },
    {
      "bookHtml": "180208181403514440733.html",
      "bookId": "1518084843514440733",
      "bookName": "最强废少",
      "bookType": "玄幻男",
      "bookTypeId": "1010"
    }
  ];

  Color renderBoxColor(int index) {
    switch(index) {
      case 0:
        return Colors.redAccent;
        break;
      case 1:
        return Colors.deepOrangeAccent;
        break;
      case 2:
        return Colors.orangeAccent;
        break;
      default:
        return Colors.black26;
    };
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('热门搜索', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          Wrap(
            spacing: 10.0,
            children: List<Widget>.generate(_hotbooks.length, (int index) {
              return Container(
                width: (MediaQuery.of(context).size.width - 40.0 - 10.0) / 2,
                height: 44.0,
                child: InkWell(
                  onTap: (){},            
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 20.0,
                        height: 20.0,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: renderBoxColor(index)
                        ),
                        child: Center(
                          child: Text((index + 1).toString(), style: TextStyle(color: Colors.white, fontSize: 12.0),),
                        ),
                      ),
                      Text(_hotbooks[index]['bookName']),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      )
    );
  }
}