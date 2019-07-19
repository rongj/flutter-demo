/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-19 15:34:00
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class BookShelfSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0 ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    IconData(0xe60e, fontFamily: 'iconfont'),
                    color: Theme.of(context).primaryColor
                  ),
                ),
                Text('签到7日，送纪念T恤、马克杯'),
              ],
            ),
          ),
          Container(
            height: 30.0,
            child: FlatButton(
              onPressed: (){
                Router.push(context, Router.loginPage);
              },
              color: Theme.of(context).primaryColor,
              shape: StadiumBorder(),
              child: Text('立即签到', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      )
    );
  }
}