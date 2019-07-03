/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-02 09:35:53
 */

import 'package:flutter/material.dart';
import 'bookshelf_header.dart';
import 'bookshelf_sign.dart';
import 'bookshelf_list.dart';

class BookShelfPage extends StatefulWidget {
  @override
  _BookShelfPageState createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fixedAppBar = _controller.position.pixels > 130;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        BookShelfHeader(
          fixed: _fixedAppBar
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              BookShelfSign(),
              BookShelfList(),
            ],
          )
        )
      ],
            
            
    );
  }
}