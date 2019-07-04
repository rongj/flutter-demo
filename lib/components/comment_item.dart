/*
 * @Author: Rongj
 * @Date: 2019-06-27 17:24:18
 * @LastEditTime: 2019-07-04 13:39:28
 */

import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  CommentItem({
    Key key,
    this.menus,
    this.onTap,
    this.icon = Icons.more_horiz,
    this.iconTooltip = '更多'
  }): super(key: key);

  final List<Map> menus;
  final Function onTap;
  final IconData icon;
  final String iconTooltip;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 44.0,
            height: 44.0,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/cat.jpg'),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Colors.white, width: 1.0)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('书友123456', style: TextStyle(fontSize: 14.0, color: Colors.black87),),
                Row(
                  children: List.generate(5, (int index) {
                    return Icon(
                      IconData(0xe61b, fontFamily: 'iconfont'),
                      size: 15.0,
                      color: Colors.orange
                    );
                  }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text('这也太神奇了', style: TextStyle(fontSize: 16.0),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('2018-10-10 23:44', style: TextStyle(fontSize: 13.0, color: Colors.black54),),
                    Row(
                      children: <Widget>[
                        Container(
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(IconData(0xe605, fontFamily: 'iconfont'), size: 14.0),
                                Text('123', style: TextStyle(fontSize: 14.0, color: Colors.black54))
                              ],
                            )
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(IconData(0xe692, fontFamily: 'iconfont'), size: 14.0),
                                Text('123', style: TextStyle(fontSize: 14.0, color: Colors.black54))
                              ],
                            )
                          )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}