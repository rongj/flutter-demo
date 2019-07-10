/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-10 10:28:59
 */

import 'package:flutter/material.dart';
import 'bookshelf_header.dart';
import 'bookshelf_sign.dart';
import 'bookshelf_list.dart';
import 'package:app/services/mock.dart';
import 'package:app/utils/prompt_tools.dart';

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

  void loadData() async {
    List res = await MockData.getBookshelfList();
    setState(() {
      _novelList = res;
    });
  }

  // 删除底部组件
  Widget buildBottomToolbar() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFe1e1e1), width: 0.8),),
        color: Colors.white,
      ),
      child: _checkedKeys.length == 0 ?
      Center(child: Text('请选择要删除的书籍', style: TextStyle(color: Colors.black54),),) :
      FlatButton(
        color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        onPressed: () => buildDeleteDailog(),
        child: Text('删除(${_checkedKeys.length})', style: TextStyle(color: Colors.white, fontSize: 16.0),),
      ),
    );
  }
  
  // 长按触发选择
  void _onLongPress() {
    setState(() {
      _showCheck = true;
    });
    widget.onCheckChange(_showCheck, buildBottomToolbar());
  }

  // 选择或取消选择
  void _onItemCheck(String id) {
    _checkedKeys.contains(id) ? _checkedKeys.remove(id) : _checkedKeys.add(id);
    setState(() {
      _checkedKeys = _checkedKeys;
    });
    widget.onCheckChange(_showCheck, buildBottomToolbar());
  }

  // 取消选择
  void _onCheckCancel() {
    setState(() {
      _showCheck = false;
      _checkedKeys = [];
    });
    widget.onCheckChange(_showCheck);
  }

  // 删除弹窗
  buildDeleteDailog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('移除所选书籍'),
        content: Text(('同时删除本地缓存')),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("确定"),
            onPressed: () {
              _onDelete().then((res) {
                if(res) {
                  _novelList.removeWhere((item) => _checkedKeys.contains(item['bookid']));
                  setState(() {
                    _novelList = _novelList;
                  });
                  Navigator.of(context).pop();
                  _onCheckCancel();
                  PromptTools.toast('移除成功');
                }
              });
            },
          ),
        ],
      )
    );
  }

  // 删除选中
  Future _onDelete() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return true;
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
                onItemCheck: _onItemCheck,
              ),
            ],
          )
        )
      ],
    );
  }
}