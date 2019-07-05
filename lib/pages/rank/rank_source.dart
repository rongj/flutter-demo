/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-05 18:12:55
 */


import 'package:flutter/material.dart';

class RankSource extends StatelessWidget {
  RankSource({
    Key key,
    this.dataSource
  }) : super(key : key);
  final List dataSource;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.redAccent, width: 0.3)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(dataSource.length, (int index) {
            return FlatButton(
              onPressed: () {},
              child: Text(
                dataSource[index]['bookname']
              ),
            );
          }),
        ),
      ),
    );
  }
}