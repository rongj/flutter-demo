/*
 * @Author: Rongj
 * @Date: 2019-07-05 09:41:42
 * @LastEditTime: 2019-07-05 13:08:34
 */

import 'package:flutter/material.dart';

class SearchHotCategory extends StatelessWidget {

  final List<String> _categories = const [
    '言情', '都市', '热血', '爽文', '校园', '异能', '重生', '复仇', '虐恋', '豪门', '屌丝', '穿越',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('搜索热词', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Wrap(
              spacing: 20.0,
              children: List<Widget>.generate(_categories.length, (int index) {
                return Container(
                  width: (MediaQuery.of(context).size.width - 40.0 - 60.0) / 4,
                  child: FlatButton(
                    onPressed: (){},
                    color: Color(0xFFe8e8e8),
                    shape: StadiumBorder(),
                    child: Text(_categories[index]),
                  )
                );
              }),
            ),
          )
        ],
      )
    );
  }
}