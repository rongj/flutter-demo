/*
 * @Author: Rongj
 * @Date: 2019-07-19 17:27:52
 * @LastEditTime: 2019-07-19 18:02:37
 */

import 'package:flutter/material.dart';

class CustomSliverView extends StatefulWidget {
  CustomSliverView({
    Key key,
    this.builder
  }): super(key: key);
  final Function builder;
    
  @override
  _CustomSliverViewState createState() => _CustomSliverViewState();
}

class _CustomSliverViewState extends State<CustomSliverView> {
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
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: widget.builder(_fixedAppBar, _controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}