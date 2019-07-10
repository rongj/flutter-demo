/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-07-10 11:00:58
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
    this.onItemCheck,
    this.goHome,
  }): super(key: key);

  final List dataSource;
  final bool showCheck;
  final Function onLongPress;
  final List checkedKeys;
  final Function onItemCheck;
  final Function goHome;
  
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
      bool _isRecommend = _item['recommend'] == '1';
      return InkWell(
        onTap: () {
          if(!showCheck) {
            Router.push(context, Router.bookdetailPage, { 'bookId': _item['bookid'] });
          } else {
            !_isRecommend && onItemCheck(_item['bookid']);
          }
        },
        onLongPress: !_isRecommend ? onLongPress : (){},
        child: NovelItemColumn(
          title: _item['bookname'],
          img: _item['img'],
          showRecommend: _isRecommend,
          ableCheck: showCheck && !_isRecommend,
          checked: checkedKeys.contains(_item['bookid']),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          Router.root(context, 1);
        },
        child: NovelItemColumn(showAdd: true),
      );
    }
  });
}