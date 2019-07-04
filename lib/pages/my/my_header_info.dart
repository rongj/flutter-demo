/*
 * @Author: Rongj
 * @Date: 2019-07-03 16:36:00
 * @LastEditTime: 2019-07-04 11:55:32
 */

import 'package:flutter/material.dart';

class MyHeaderInfo extends StatelessWidget {

  final TextStyle _tsTop = const TextStyle(
    color: Colors.white,
    fontSize: 16.0
  );

  final TextStyle _tsBottom = const TextStyle(
    color: Colors.white70,
    fontSize: 14.0
  );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Text('0书币', style: _tsTop),
                Text('余额', style: _tsBottom),
              ],
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Text('0/8', style: _tsTop),
                Text('任务', style: _tsBottom),
              ],
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe83d, fontFamily: 'iconfont'), color: Colors.white, size: 20.0,),
                Text('VIP', style: _tsBottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}