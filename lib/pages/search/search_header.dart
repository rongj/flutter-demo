/*
 * @Author: Rongj
 * @Date: 2019-07-05 09:42:37
 * @LastEditTime: 2019-07-17 13:50:05
 */

import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  @override
  _SearchHeaderState createState() => _SearchHeaderState();
} 

class _SearchHeaderState extends State<SearchHeader> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController()..addListener(() {
      // print('input ${_textController.text}');
    });
  }

  _handleInputSubmit() {
    print('input ${_textController.text}');
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Theme(
              data: ThemeData().copyWith(
                primaryColor: Colors.transparent,
                hintColor: Colors.transparent,
              ),
              child: TextField(
                controller: _textController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                  ),
                  hintText: '请输入关键词',
                  hintStyle: TextStyle(color: Colors.black26),
                  fillColor: Color(0xFFf1f1f1),
                  filled: true,
                  prefixIcon: Icon(
                    IconData(0xe613, fontFamily: 'iconfont'),
                    size: 16.0,
                    color: Colors.black54,
                  ),
                  suffixIcon: Container(
                    width: 20.0,
                    height: 20.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: FlatButton(
                      onPressed: () => _textController.clear(),
                      shape: CircleBorder(),
                      color: Colors.black12,
                      child: Icon(
                        IconData(0xe61f, fontFamily: 'iconfont'),
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ),
                onChanged: (text) => print('change $text'),
                onSubmitted: _handleInputSubmit(),
              ),
            )
          ),
          Container(
            width: 60.0,
            child: FlatButton(
              onPressed: _handleInputSubmit,
              child: Text('搜索'),
            )
          )
        ],
      )
    );
  }
}