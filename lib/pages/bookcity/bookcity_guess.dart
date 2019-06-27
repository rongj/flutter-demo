/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-06-27 16:12:19
 */

import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';

class BookCityGuess extends StatelessWidget {
  final List<Map> _novelData = const [
    {
      "bookname": "桃运大相师",
      "img": "http://images01.mopimg.cn/imgs/20190110/20190110105857_a2dad8344ceadf049e4e8321d9c5c2d0.jpg",
      "url": "//mwx.mop.com/book.html?bookid=1527572298667538069&htmlName=180529133818667538069.html"
    },
    {
      "bookname": "妈咪宝贝：总裁爹地超给力",
      "img": "http://images01.mopimg.cn/imgs/20190110/20190110105923_32266b5803e0b3d55fc8337b5bf0d598.jpg",
      "url": "//mwx.mop.com/book.html?bookid=1530787743147124720&htmlName=180705184903147124720.html"
    },
    {
      "bookname": "武道大帝",
      "img": "http://images01.mopimg.cn/imgs/20190110/20190110105948_5313ec64f332ff9cbe7fc299aee1ae68.jpg",
      "url": "//mwx.mop.com/book.html?bookid=1527560458418384226&htmlName=180529102058418384226.html"
    },
    {
      "bookname": "宠妃无度：暴君的药引",
      "img": "http://images01.mopimg.cn/imgs/20190110/20190110110011_48a1230fb0173f6eb7227ae3c20c3686.jpg",
      "url": "//mwx.mop.com/book.html?bookid=1527561777650968731&htmlName=180529104257650968731.html"
    },
    {
      "bookname": "极品透视仙医",
      "img": "http://images01.mopimg.cn/imgs/20190110/20190110110040_d239c58a90d9e4263a7bbec2d6c965c2.jpg",
      "url": "//mwx.mop.com/book.html?bookid=1531811620092401871&htmlName=180717151340092401871.html"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '猜你喜欢',
      body: Container(
        height: 96.0,
        margin: EdgeInsets.only(top: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _novelData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 160.0,
              margin: EdgeInsets.only(right: index != _novelData.length -1 ? 10.0 : 0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      image: DecorationImage(
                        image: NetworkImage(_novelData[index]['img']),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Text(
                    _novelData[index]['bookname'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(height: 1.2),
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}