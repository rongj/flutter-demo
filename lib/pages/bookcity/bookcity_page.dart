/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-06-27 16:12:57
 */


import 'package:flutter/material.dart';
import 'bookcity_header.dart';
import 'bookcity_navs.dart';
import 'bookcity_week.dart';
import 'bookcity_quality.dart';
import 'bookcity_guess.dart';
import 'bookcity_hot.dart';

class BookCityPage extends StatefulWidget {
  @override
  _BookCityPageState createState() => _BookCityPageState();
}

class _BookCityPageState extends State<BookCityPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fixedAppBar = _controller.offset > 120;
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
        BookCityHeader(
          fixed: _fixedAppBar
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              BookCityNavs(),
              BookCityWeek(),
              BookCityQuality(),
              BookCityGuess(),
              BookCityHot(),
            ],
          )
        )
      ],
    );
  }
}