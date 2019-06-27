/*
 * @Author: Rongj
 * @Date: 2019-06-27 17:24:18
 * @LastEditTime: 2019-06-27 17:56:11
 */

import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  PopupMenu({
    Key key,
    this.menus,
    this.onTap
  }): super(key: key);

  final List<Map> menus;
  final Function onTap;

  // _buildPopup
  
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_horiz),
      itemBuilder: (BuildContext context) => List<PopupMenuItem<String>>.generate(menus.length, (index) {
        return PopupMenuItem(
          value: menus[index]['key'],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(menus[index]['icon'], color: Theme.of(context).primaryColor),
              Text(menus[index]['text']),
            ],
          )
        );
      }),
      onSelected: (String action) => onTap(action),
    );
  }
}