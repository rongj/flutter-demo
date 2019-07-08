/*
 * @Author: Rongj
 * @Date: 2019-07-05 13:57:46
 * @LastEditTime: 2019-07-08 17:57:36
 */


import 'package:flutter/material.dart';
import 'package:app/components/loading.dart';
import 'package:app/services/api.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({
    Key key,
    this.bookId
  }) : super(key: key);
  final String bookId;
  
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  ScrollController _scrollController;
  String _sort = 'asc';
  int _page = 1;
  List _catalogList = [];
  bool _showLoadingMore = true;
  
  @override
  void initState() {
    super.initState();
    loadData();
    _scrollController = ScrollController()..addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          _page += 1;
          _showLoadingMore = true;
        });
        loadData();
      }
    });
  }

  loadData() async {
    if(!_showLoadingMore) {
      return;
    }
    var _res = await Api.getBookCatalog({
      'bookId': widget.bookId,
      'orderType': _sort,
      'pageNo': _page,
      'pageSize': 50
    });
    setState(() {
      _showLoadingMore = false;
      _catalogList = _res['data']['entityList'];
    });
  }
  
  _handleSortChange() {
    setState((){
      bool _isAsc = _sort == 'asc';
      _sort = _isAsc ? 'desc' : 'asc';
      _page = 1;
      _showLoadingMore = true;
      // _catalogList = _catalogList.reversed.toList();
    });
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目录'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: <Widget>[
          IconButton(
            onPressed: _handleSortChange,
            icon: Icon(IconData(_sort == 'asc' ? 0xe60c : 0xe60a, fontFamily: 'iconfont')),
          )
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _catalogList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return index == _catalogList.length ? 
          _showLoadingMore ? Loading() : null :
          InkWell(
            onTap: (){},
            child: Container(
              height: 44.0,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12, width: 0.8))
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Text(_catalogList[index]['title'])
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
