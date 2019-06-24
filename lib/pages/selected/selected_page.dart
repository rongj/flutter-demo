/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-24 15:45:51
 */


import 'package:flutter/material.dart';

class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}


class _SelectedPageState extends State<SelectedPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('精选'),
            ),
          )
        ],
      ),
    );
  }
}