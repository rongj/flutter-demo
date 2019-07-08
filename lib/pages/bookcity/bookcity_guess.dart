/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-07-08 19:55:04
 */

import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/routers.dart';

class BookCityGuess extends StatelessWidget {
  BookCityGuess({
    Key key,
    this.dataSource
  }) : super(key : key);
  final List dataSource;
  
  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '猜你喜欢',
      body: Container(
        height: 96.0,
        margin: EdgeInsets.only(top: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataSource.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 160.0,
              margin: EdgeInsets.only(right: index != dataSource.length -1 ? 10.0 : 0),
              child: InkWell(
                onTap: () {
                  Router.push(context, Router.bookdetailPage, { 'bookId': dataSource[index]['url'] });
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        image: DecorationImage(
                          image: NetworkImage('http:'+dataSource[index]['img']),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    Text(
                      dataSource[index]['title'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(height: 1.2),
                    )
                  ],
                ),
              )
            );
          },
        ),
      )
    );
  }
}