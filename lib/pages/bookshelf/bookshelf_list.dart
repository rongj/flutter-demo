/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-09 10:50:53
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_item_column.dart';
import 'package:app/components/loading.dart';
import 'package:app/routers.dart';

class BookShelfList extends StatelessWidget {
  BookShelfList({
    Key key,
    this.dataSource,
    this.showCheck,
    this.onLongPress,
    this.checkedKeys,
    this.onCheck
  }): super(key: key);

  final List dataSource;
  final bool showCheck;
  final Function onLongPress;
  final List checkedKeys;
  final Function onCheck;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: dataSource.length > 0 ? Wrap(
        spacing: 20.0,
        runSpacing: 15.0,
        children: _bookList(context),
      ) : Loading()
    );
  }

  List<Widget> _bookList(BuildContext context) => List.generate(dataSource.length + 1, (index) {
    if(index < dataSource.length) {
      Map _item = dataSource[index];
      return InkWell(
        onTap: () {
          if(!showCheck) {
            Router.push(context, Router.bookdetailPage, { 'bookId': _item['bookid'] });
          } else {
            onCheck(_item['bookid']);
          }
        },
        onLongPress: onLongPress,
        child: NovelItemColumn(
          title: _item['bookname'],
          img: _item['img'],
          showRecommend: index < 3,
          ableCheck: showCheck && checkedKeys.contains(_item['bookid'])
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          //   return BookCityPage();
          // }));
        },
        child: NovelItemColumn(showAdd: true),
      );
    }
  });
}