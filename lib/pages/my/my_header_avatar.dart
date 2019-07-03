/*
 * @Author: Rongj
 * @Date: 2019-07-03 16:36:00
 * @LastEditTime: 2019-07-03 17:19:52
 */

import 'package:flutter/material.dart';

class MyHeaderAvatar extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/cat.jpg'),
                    fit: BoxFit.cover
                  ),
                  border: Border.all(color: Colors.white, width: 1.0)
                ),
              ),
              Text(
                '登录/注册',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              '签到',
              style: TextStyle(
                fontSize: 14.0
              )
            ),
          )
        ],
      ),
    );
  }
}