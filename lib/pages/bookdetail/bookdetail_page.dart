/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:17:19
 * @LastEditTime: 2019-07-09 17:10:19
 */

import 'package:flutter/material.dart';
import 'bookdetail_header.dart';
import 'bookdetail_info.dart';
import 'bookdetail_links.dart';
import 'bookdetail_comment.dart';
import 'bookdetail_relevant.dart';
import 'bookdetail_bottom.dart';
import 'package:app/components/loading.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/bottom_share.dart';

class BookDetailPage extends StatefulWidget {
  BookDetailPage({
    Key key,
    this.bookId
  }) : super(key: key);
  final String bookId;
  
  @override
  _BookDetailPageState createState () => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  ScrollController _controller;
  bool _fixedAppBar = false;
  bool _loading = true;
  Map _detail;
  String _detailMsg = '';
  List _commentList = [];
  List _relList = [];

  @override
  void initState() {
    super.initState();
    print(widget.bookId);
    loadData();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fixedAppBar = _controller.position.pixels > 50;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  loadData() async {
    var _res = await Api.getBookDetail({ 'bookId': widget.bookId });
    var _res2 = await Api.getCommentList({ 'bookId': widget.bookId, 'pageSize': 3 });
    var _res3 = await Api.getRelList({ 'bookId': widget.bookId });
    setState(() {
      _loading = false;
      _detail = _res['data'];
      _detailMsg = _res['msg'];
      _commentList = _res2['data']['entityList'];
      _relList = _res3['data'];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _fixedAppBar ? _detail['bookName'] : '',
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: _fixedAppBar ? Colors.white : Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: _fixedAppBar ? null : Colors.white),
        actions: _detail != null ? <Widget>[
          IconButton(
            onPressed: () => BottomShare.showShareSheet(context),
            tooltip: '分享',
            icon: Icon(IconData(0xe739, fontFamily: 'iconfont')),
          )
        ] : null,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: _detail != null ? Column(
          children: <Widget>[
            BookDetailHeader(detail: _detail),
            BookDetailInfo(detail: _detail),
            BookDetailLinks(detail: _detail),
            BookDetailComment(replynum: _detail['replynum'], dataSource: _commentList,),
            BookDetailRelevant(dataSource: _relList)
          ],
        ) : Center(
          child: _loading ? Loading() : Text(_detailMsg),
        ),
      ),
      bottomNavigationBar: _detail != null ? BookDetailBottom() : null
    );
  }
}