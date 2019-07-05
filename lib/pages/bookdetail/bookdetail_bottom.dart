/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:28:38
 * @LastEditTime: 2019-07-05 09:36:22
 */

import 'package:flutter/material.dart';

class BookDetailBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              onPressed: (){},
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xe65d, fontFamily: 'iconfont'), size: 22.0,),
                  Text('加入书架', style: TextStyle(fontSize: 12.0))
                ],
              ),
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            color: Theme.of(context).primaryColor,
            child: FlatButton(
              padding: EdgeInsets.only(top: 8.0),
              onPressed: (){},
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xe693, fontFamily: 'iconfont'), size: 22.0, color: Colors.white,),
                  Text('免费试读', style: TextStyle(fontSize: 12.0, color: Colors.white))
                ],
              ),
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              onPressed: (){},
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xe791, fontFamily: 'iconfont'), size: 22.0,),
                  Text('离线下载', style: TextStyle(fontSize: 12.0))
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}