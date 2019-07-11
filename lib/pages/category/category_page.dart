/*
 * @Author: Rongj
 * @Date: 2019-07-05 13:57:46
 * @LastEditTime: 2019-07-11 09:41:58
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class CategoryPage extends StatelessWidget {
  final List _categoryMan = const [
    {
      'text': '都市',
      'type': 'dushi',
      'code': '1014'
    },
    {
      'text': '武侠',
      'type': 'wuxia',
      'code': '1012'
    },
    {
      'text': '灵异',
      'type': 'lingyi',
      'code': '1024'
    },
    {
      'text': '玄幻',
      'type': 'xuanhuan',
      'code': '1010'
    },
    {
      'text': '科幻',
      'type': 'kehuan',
      'code': '1022'
    },
    {
      'text': '历史',
      'type': 'lishi',
      'code': '1018'
    },
    {
      'text': '悬疑',
      'type': 'xuanyi',
      'code': '1026'
    },
    {
      'text': '同人',
      'type': 'tongren',
      'code': '1028'
    },
    {
      'text': '竞技',
      'type': 'jingji',
      'code': '1020'
    },
    {
      'text': '军事',
      'type': 'junshi',
      'code': '1016'
    },
  ];
  final List _categoryWoman = const [
    {
      'text': '言情',
      'type': 'yanqing',
      'code': '1015'
    },
    {
      'text': '历史',
      'type': 'lishi',
      'code': '1018'
    },
    {
      'text': '灵异',
      'type': 'lingyi',
      'code': '1024'
    },
    {
      'text': '玄幻',
      'type': 'xuanhuan',
      'code': '1011'
    },
    {
      'text': '悬疑',
      'type': 'xuanyi',
      'code': '1027'
    },
  ];

  List<Widget> buildCategoryList(BuildContext context, List category, String gender) {
    return category.map((item) {
      return InkWell(
        onTap: (){
          Router.push(context, Router.categoryDetailPage, {
            'title': item['text'],
            'gender': gender,
            'type': item['code'],
          });
        },
        child: Container(
          height: 44.0,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12, width: 0.8))
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Text(item['text'])
            ],
          ),
        )
      );
    }).toList();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                color: Color(0xFFf1f1f1),
                child: Text('男生频道', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),),
              )
            ]
            ..addAll(buildCategoryList(context, _categoryMan, 'man'))
            ..add(Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Color(0xFFf1f1f1),
              child: Text('女生频道', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),),
            ))..addAll(buildCategoryList(context, _categoryWoman, 'woman')),
          ),
        ),
      )
    );
  }
}
