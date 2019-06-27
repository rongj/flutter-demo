/*
 * @Author: Rongj
 * @Date: 2019-06-25 11:55:35
 * @LastEditTime: 2019-06-27 16:41:39
 */

import 'package:flutter/material.dart';
import 'package:app/components/novel_item_column.dart';

class BookShelfList extends StatefulWidget {
  @override
  _BookShelfListState createState() => _BookShelfListState();
}

class _BookShelfListState extends State<BookShelfList> {

  List<Map> _novelData = const [
    {
      "bookname": "法医狂妃",
      "author": "谁家mm",
      "img": "http://images01.mopimg.cn/imgs/20181027/20181027_6a449c2a8aa7ac3eba3328ef3ec2bfa5_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181027135412762131928.html",
      "bookid": "1540619652762131928"
    },
    {
      "bookname": "九阳天尊",
      "author": "冰魂",
      "img": "http://images01.mopimg.cn/imgs/20180908/20180908_cba83311403553830ad9618e3bc73cd0_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180908071944561186889.html",
      "bookid": "1536362384561186889"
    },
    {
      "bookname": "胜邪天下，绝世质子妃",
      "author": "拂风旖旎",
      "img": "http://images01.mopimg.cn/imgs/20180710/20180710_d188bc93e4bcb342e9b7be86ac579b32_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180710165330067354904.html",
      "bookid": "1531212810067354904"
    },
    {
      "bookname": "暴力俏村姑",
      "author": "风轻灵",
      "img": "http://images01.mopimg.cn/imgs/20181025/20181025_e58cc6cb66f3475d56bc9ba41bb3b361_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181025060831710292340.html",
      "bookid": "1540418911710292340"
    },
    {
      "bookname": "最强仙尊重生都市",
      "author": "非言",
      "img": "http://images01.mopimg.cn/imgs/20181018/20181018_c42a89885f7f63d34959fc3433902f2f_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181018064753015671232.html",
      "bookid": "1539816473015671232"
    },
    {
      "bookname": "天庭微博红包群",
      "author": "布凡",
      "img": "http://images01.mopimg.cn/imgs/20181027/20181027_df3834d2766738c3f0ad081702244987_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181027123844559796814.html",
      "bookid": "1540615124559796814"
    },
    {
      "bookname": "田园锦绣：农家小厨娘",
      "author": "烟月",
      "img": "http://images01.mopimg.cn/imgs/20181025/20181025_38f31fa5151900988e828181a15f3397_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181025115426188669247.html",
      "bookid": "1540439666188669247"
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: Wrap(
        spacing: 20.0,
        runSpacing: 15.0,
        children: _bookList(),
      )
    );
  }

  List<Widget> _bookList() => List.generate(_novelData.length + 1, (index) {
    if(index < _novelData.length) {
      return NovelItemColumn(
        title: _novelData[index]['bookname'],
        img: _novelData[index]['img'],
        // subtitle: _novelData[index]['author'],
        showRecommend: index < 3
      );
    }else {
      return NovelItemColumn(showAdd: true);
    }
  });
}