/*
 * @Author: Rongj
 * @Date: 2019-06-26 17:07:18
 * @LastEditTime: 2019-06-26 20:04:02
 */

import 'package:flutter/material.dart';

class PlateLayout extends StatelessWidget {
  PlateLayout({
    Key key,
    this.title,
    this.toolBar,
    this.body,
  }): super(key: key);

  final String title;
  final Widget toolBar;
  final Widget body;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 2.0,
                    height: 15.0,
                    margin: EdgeInsets.only(right: 5.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
              toolBar
            ],
          ),
          body
        ],
      ),
    );
  }
}