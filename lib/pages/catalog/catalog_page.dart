/*
 * @Author: Rongj
 * @Date: 2019-07-05 13:57:46
 * @LastEditTime: 2019-07-05 14:30:25
 */


import 'package:flutter/material.dart';

class CataLogPage extends StatefulWidget {
  @override
  _CataLogPageState createState() => _CataLogPageState();
}


class _CataLogPageState extends State<CataLogPage> {
  String _sort = 'asc';

  List<Map> _catalogList = [
    {
      "rowKey": "7711599621691638244",
      "ctsRdts": "1511772415163137563",
      "bookId": "1511772412138830163",
      "htmlName": "171127164655163137563.html",
      "status": "1",
      "title": "第1章 偶遇",
      "vip": "0",
      "isPay": "0",
      "chapterno": "1"
    },
    {
      "rowKey": "7711599621270892327",
      "ctsRdts": "1511772415583883480",
      "bookId": "1511772412138830163",
      "htmlName": "171127164655583883480.html",
      "status": "1",
      "title": "第2章 同居御姐",
      "vip": "0",
      "isPay": "0",
      "chapterno": "2"
    },
    {
      "rowKey": "7711599620571910598",
      "ctsRdts": "1511772416282865209",
      "bookId": "1511772412138830163",
      "htmlName": "171127164656282865209.html",
      "status": "1",
      "title": "第3章 给你害死了",
      "vip": "0",
      "isPay": "0",
      "chapterno": "3"
    },
    {
      "rowKey": "7711599619770288186",
      "ctsRdts": "1511772417084487621",
      "bookId": "1511772412138830163",
      "htmlName": "171127164657084487621.html",
      "status": "1",
      "title": "第4章 来帮我按按",
      "vip": "0",
      "isPay": "0",
      "chapterno": "4"
    },
    {
      "rowKey": "7711599619071202451",
      "ctsRdts": "1511772417783573356",
      "bookId": "1511772412138830163",
      "htmlName": "171127164657783573356.html",
      "status": "1",
      "title": "第5章 帮夏雪打游戏",
      "vip": "0",
      "isPay": "0",
      "chapterno": "5"
    },
    {
      "rowKey": "7711599618131927141",
      "ctsRdts": "1511772418722848666",
      "bookId": "1511772412138830163",
      "htmlName": "171127164658722848666.html",
      "status": "1",
      "title": "第6章 小黄金",
      "vip": "0",
      "isPay": "0",
      "chapterno": "6"
    },
    {
      "rowKey": "7711599617709561242",
      "ctsRdts": "1511772419145214565",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659145214565.html",
      "status": "1",
      "title": "第7章 那个人死掉了",
      "vip": "0",
      "isPay": "0",
      "chapterno": "7"
    },
    {
      "rowKey": "7711599617667633799",
      "ctsRdts": "1511772419187142008",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659187142008.html",
      "status": "1",
      "title": "第8章 大神带我",
      "vip": "0",
      "isPay": "0",
      "chapterno": "8"
    },
    {
      "rowKey": "7711599617613898472",
      "ctsRdts": "1511772419240877335",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659240877335.html",
      "status": "1",
      "title": "第9章 你们昨晚去干啥了",
      "vip": "0",
      "isPay": "0",
      "chapterno": "9"
    },
    {
      "rowKey": "7711599617575067715",
      "ctsRdts": "1511772419279708092",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659279708092.html",
      "status": "1",
      "title": "第10章 巧合",
      "vip": "0",
      "isPay": "0",
      "chapterno": "10"
    },
    {
      "rowKey": "7711599617526176192",
      "ctsRdts": "1511772419328599615",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659328599615.html",
      "status": "1",
      "title": "第11章 最强王者孙迪",
      "vip": "0",
      "isPay": "0",
      "chapterno": "11"
    },
    {
      "rowKey": "7711599617489162916",
      "ctsRdts": "1511772419365612891",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659365612891.html",
      "status": "1",
      "title": "第12章 帮你报仇",
      "vip": "0",
      "isPay": "0",
      "chapterno": "12"
    },
    {
      "rowKey": "7711599617451854526",
      "ctsRdts": "1511772419402921281",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659402921281.html",
      "status": "1",
      "title": "第13章 我的锅",
      "vip": "0",
      "isPay": "0",
      "chapterno": "13"
    },
    {
      "rowKey": "7711599617409796285",
      "ctsRdts": "1511772419444979522",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659444979522.html",
      "status": "1",
      "title": "第14章 我们会赢",
      "vip": "0",
      "isPay": "0",
      "chapterno": "14"
    },
    {
      "rowKey": "7711599617379648112",
      "ctsRdts": "1511772419475127695",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659475127695.html",
      "status": "1",
      "title": "第15章 要翻盘了",
      "vip": "0",
      "isPay": "0",
      "chapterno": "15"
    },
    {
      "rowKey": "7711599617346388258",
      "ctsRdts": "1511772419508387549",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659508387549.html",
      "status": "1",
      "title": "第16章 看我孙悟空",
      "vip": "0",
      "isPay": "0",
      "chapterno": "16"
    },
    {
      "rowKey": "7711599617315264673",
      "ctsRdts": "1511772419539511134",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659539511134.html",
      "status": "1",
      "title": "第17章 要和你们班花做朋友",
      "vip": "0",
      "isPay": "0",
      "chapterno": "17"
    },
    {
      "rowKey": "7711599617284944036",
      "ctsRdts": "1511772419569831771",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659569831771.html",
      "status": "1",
      "title": "第18章 红发妹纸",
      "vip": "0",
      "isPay": "0",
      "chapterno": "18"
    },
    {
      "rowKey": "7711599617255444590",
      "ctsRdts": "1511772419599331217",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659599331217.html",
      "status": "1",
      "title": "第19章 你是卧底吧",
      "vip": "0",
      "isPay": "0",
      "chapterno": "19"
    },
    {
      "rowKey": "7711599617220825072",
      "ctsRdts": "1511772419633950735",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659633950735.html",
      "status": "1",
      "title": "第20章 越塔强杀荆轲",
      "vip": "0",
      "isPay": "0",
      "chapterno": "20"
    },
    {
      "rowKey": "7711599617189839505",
      "ctsRdts": "1511772419664936302",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659664936302.html",
      "status": "1",
      "title": "第21章 怎么又是你",
      "vip": "1",
      "isPay": "0",
      "chapterno": "21"
    },
    {
      "rowKey": "7711599617151116802",
      "ctsRdts": "1511772419703659005",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659703659005.html",
      "status": "1",
      "title": "第22章 你真浪",
      "vip": "1",
      "isPay": "0",
      "chapterno": "22"
    },
    {
      "rowKey": "7711599617118486990",
      "ctsRdts": "1511772419736288817",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659736288817.html",
      "status": "1",
      "title": "第23章 孙迪不是男的",
      "vip": "1",
      "isPay": "0",
      "chapterno": "23"
    },
    {
      "rowKey": "7711599617083058273",
      "ctsRdts": "1511772419771717534",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659771717534.html",
      "status": "1",
      "title": "第24章 羡慕嫉妒恨",
      "vip": "1",
      "isPay": "0",
      "chapterno": "24"
    },
    {
      "rowKey": "7711599617053132152",
      "ctsRdts": "1511772419801643655",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659801643655.html",
      "status": "1",
      "title": "第25章 食堂开片",
      "vip": "1",
      "isPay": "0",
      "chapterno": "25"
    },
    {
      "rowKey": "7711599617019137278",
      "ctsRdts": "1511772419835638529",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659835638529.html",
      "status": "1",
      "title": "第26章 叫家长",
      "vip": "1",
      "isPay": "0",
      "chapterno": "26"
    },
    {
      "rowKey": "7711599616988413991",
      "ctsRdts": "1511772419866361816",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659866361816.html",
      "status": "1",
      "title": "第27章 黄小姐你好",
      "vip": "1",
      "isPay": "0",
      "chapterno": "27"
    },
    {
      "rowKey": "7711599616952106405",
      "ctsRdts": "1511772419902669402",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659902669402.html",
      "status": "1",
      "title": "第28章 跪下道歉",
      "vip": "1",
      "isPay": "0",
      "chapterno": "28"
    },
    {
      "rowKey": "7711599616922471221",
      "ctsRdts": "1511772419932304586",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659932304586.html",
      "status": "1",
      "title": "第29章 凯哥很欣赏你",
      "vip": "1",
      "isPay": "0",
      "chapterno": "29"
    },
    {
      "rowKey": "7711599616888652799",
      "ctsRdts": "1511772419966123008",
      "bookId": "1511772412138830163",
      "htmlName": "171127164659966123008.html",
      "status": "1",
      "title": "第30章 女人不是东西",
      "vip": "1",
      "isPay": "0",
      "chapterno": "30"
    },
    {
      "rowKey": "7711599616854399268",
      "ctsRdts": "1511772420000376539",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700000376539.html",
      "status": "1",
      "title": "第31章 燃烧的剑，燃烧的心",
      "vip": "1",
      "isPay": "0",
      "chapterno": "31"
    },
    {
      "rowKey": "7711599616822179874",
      "ctsRdts": "1511772420032595933",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700032595933.html",
      "status": "1",
      "title": "第32章 你好怂啊",
      "vip": "1",
      "isPay": "0",
      "chapterno": "32"
    },
    {
      "rowKey": "7711599616790525927",
      "ctsRdts": "1511772420064249880",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700064249880.html",
      "status": "1",
      "title": "第33章 死里逃生",
      "vip": "1",
      "isPay": "0",
      "chapterno": "33"
    },
    {
      "rowKey": "7711599616756941260",
      "ctsRdts": "1511772420097834547",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700097834547.html",
      "status": "1",
      "title": "第34章 越水晶干他",
      "vip": "1",
      "isPay": "0",
      "chapterno": "34"
    },
    {
      "rowKey": "7711599616729509870",
      "ctsRdts": "1511772420125265937",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700125265937.html",
      "status": "1",
      "title": "第35章 诗兴大发",
      "vip": "1",
      "isPay": "0",
      "chapterno": "35"
    },
    {
      "rowKey": "7711599616698675334",
      "ctsRdts": "1511772420156100473",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700156100473.html",
      "status": "1",
      "title": "第36章 你们这帮蛊惑人的小妖精",
      "vip": "1",
      "isPay": "0",
      "chapterno": "36"
    },
    {
      "rowKey": "7711599616669944209",
      "ctsRdts": "1511772420184831598",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700184831598.html",
      "status": "1",
      "title": "第37章 我是大表姐",
      "vip": "1",
      "isPay": "0",
      "chapterno": "37"
    },
    {
      "rowKey": "7711599616637428110",
      "ctsRdts": "1511772420217347697",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700217347697.html",
      "status": "1",
      "title": "第38章 敌羞吾去脱他衣",
      "vip": "1",
      "isPay": "0",
      "chapterno": "38"
    },
    {
      "rowKey": "7711599616609580786",
      "ctsRdts": "1511772420245195021",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700245195021.html",
      "status": "1",
      "title": "第39章 成都韩信",
      "vip": "1",
      "isPay": "0",
      "chapterno": "39"
    },
    {
      "rowKey": "7711599616575839450",
      "ctsRdts": "1511772420278936357",
      "bookId": "1511772412138830163",
      "htmlName": "171127164700278936357.html",
      "status": "1",
      "title": "第40章 韩信打韩信",
      "vip": "1",
      "isPay": "0",
      "chapterno": "40"
    }
  ];
  
  _handleSortChange() {
    setState((){
      bool _isAsc = _sort == 'asc';
      _sort = _isAsc ? 'desc' : 'asc';
      _catalogList = _catalogList.reversed.toList();
    });
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
        itemCount: _catalogList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
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
