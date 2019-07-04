/*
 * @Author: Rongj
 * @Date: 2019-06-27 17:24:18
 * @LastEditTime: 2019-07-04 13:39:28
 */

import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget {
  AppBarMenu({
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
    return IconButton(
      icon: Icon(icon),
      tooltip: iconTooltip,
      onPressed: () async {
        final result = await showMenu(
          context: context,
          position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width, 80.0, 0, 0),
          items: List<PopupMenuItem<String>>.generate(menus.length, (index) {
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
          })
        );
        onTap(result);
      }
    );
  }
}