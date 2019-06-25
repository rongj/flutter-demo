/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-25 15:50:27
 */


import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  // String foo;
  // String bar;

  // SearchPage({
  //   Key key,
  //   this.foo,
  //   this.bar
  // }) : super(key: key);
  
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('search'),
      ),
    );
  }
}