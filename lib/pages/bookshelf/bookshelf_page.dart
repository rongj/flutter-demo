/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-09 10:50:07
 */

import 'package:flutter/material.dart';
import 'bookshelf_header.dart';
import 'bookshelf_sign.dart';
import 'bookshelf_list.dart';
import 'package:app/services/mock.dart';

class BookShelfPage extends StatefulWidget {
  BookShelfPage({
    Key key,
    this.onCheckChange
  }): super(key: key);
  final Function onCheckChange;
  
  @override
  _BookShelfPageState createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;
  List _novelList = [];
  bool _showCheck = false;
  List _checkedKeys = [];

  @override
  void initState() {
    super.initState();
    loadData();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fixedAppBar = _controller.position.pixels > 130;
      });
    });
  }

  loadData() async {
    List res = await MockData.getBookshelfList();
    setState(() {
      _novelList = res;
    });
  }

  Widget buildBottomToolbar() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFe1e1e1), width: 0.8),),
        color: Colors.white,
      ),
      child: FlatButton(
        // color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        onPressed: (){},
        child: Text('删除', style: TextStyle(color: Colors.white, fontSize: 16.0),),
      ),
    );
  }
  
  _onLongPress() {
    setState(() {
      _showCheck = true;
    });
    widget.onCheckChange(_showCheck, buildBottomToolbar());
  }

  _onCheck(String id) {
    print(id);
    // if(_checkedKeys.contains(id)) {
    //   setState(() {
    //     _checkedKeys = _checkedKeys.remove(id);
    //   });
    // } else {
    //   setState(() {
    //     _checkedKeys = _checkedKeys.add(id);
    //   });
    // }
  }

  _onCheckCancel() {
    setState(() {
      _showCheck = false;
    });
    widget.onCheckChange(_showCheck);
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
          fixed: _fixedAppBar,
          showCheck: _showCheck,
          onCheckCancel: _onCheckCancel,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              BookShelfSign(),
              BookShelfList(
                showCheck: _showCheck,
                dataSource: _novelList,
                onLongPress: _onLongPress,
                checkedKeys: _checkedKeys,
                onCheck: _onCheck,
              ),
            ],
          )
        )
      ],
    );
  }
}