/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:20:39
 * @LastEditTime: 2019-07-09 11:23:26
 */

import 'package:flutter/material.dart';

class CategoryDetailFilter extends StatefulWidget {
  CategoryDetailFilter({
    Key key,
    this.status,
    this.size,
    this.onChange
  }): super(key: key);
  final String status;
  final String size;
  final Function onChange;
  
  @override
  _CategoryDetailFilterState createState() => _CategoryDetailFilterState();
}

class _CategoryDetailFilterState extends State<CategoryDetailFilter> {
  final List _statusList = const [
    {
      'title' : '全部',
      'code': '',
    },
    {
      'title' : '连载中',
      'code': '0',
    },
    {
      'title' : '已完结',
      'code': '1',
    },
  ];

  final List _wordsList = const [
    {
      'title' : '全部',
      'code': '',
    },
    {
      'title' : '30万字以下',
      'code': '1',
    },
    {
      'title' : '30-50万字',
      'code': '2',
    },
    {
      'title' : '50-100万字',
      'code': '3',
    },
    {
      'title' : '100-200万字',
      'code': '4',
    },
    {
      'title' : '200万字以上',
      'code': '5',
    },
  ];

  String _status = '';
  String _size = '';

  List<Widget> buildFilter(List list, String type) {
    return list.map((item){
      bool _isActive = isActive(type, item['code']);
      return Container(
        height: 30.0,
        child: FlatButton(
          onPressed: () => _handleFilterChange(type, item['code']),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              width: 0.5,
              color: _isActive ? Theme.of(context).primaryColor : Colors.black45
            )
          ) ,
          child: Text(
            item['title'],
            style: TextStyle(
              color: _isActive ? Theme.of(context).primaryColor : Colors.black87,
              fontSize: 13.0
            ),
          ),
        ),
      );
    }).toList();
  }

  bool isActive(String type, String code) {
    bool _isActive = false;
    if(type == 'status') {
      _isActive = code == _status;
    } else if(type == 'size') {
      _isActive = code == _size;
    }
    return _isActive;
  }

  _handleFilterChange(String type, String code) {
    if(type == 'status') {
      setState(() => _status = code);
    } else if(type == 'size') {
      setState(() => _size = code);
    }
    widget.onChange(_status, _size);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFe1e1e1), width: 0.5)),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: buildFilter(_statusList, 'status'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: buildFilter(_wordsList, 'size'),
            ),
          ),
        ],
      ),
    );
  }
}