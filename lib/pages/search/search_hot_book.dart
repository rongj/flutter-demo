/*
 * @Author: Rongj
 * @Date: 2019-07-05 09:41:42
 * @LastEditTime: 2019-07-11 14:33:56
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class SearchHotBook extends StatelessWidget {
  SearchHotBook({
    Key key,
    this.dataSource
  }) : super(key: key);
  final List dataSource;

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
    }
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
            children: List<Widget>.generate(dataSource.length, (int index) {
              return Container(
                width: (MediaQuery.of(context).size.width - 40.0 - 10.0) / 2,
                height: 44.0,
                child: InkWell(
                  onTap: (){
                    Router.push(context, Router.bookdetailPage, { 'bookId': dataSource[index]['bookId'] });
                  },            
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
                      Text(dataSource[index]['bookName']),
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