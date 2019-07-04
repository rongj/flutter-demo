/*
 * @Author: Rongj
 * @Date: 2019-07-04 14:17:19
 * @LastEditTime: 2019-07-04 20:04:19
 */

import 'package:flutter/material.dart';
import 'bookdetail_header.dart';
import 'bookdetail_info.dart';
import 'bookdetail_links.dart';
import 'bookdetail_relevant.dart';

class BookDetailPage extends StatefulWidget {
  @override
  _BookDetailPageState createState () => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  // ScrollController _controller;
  // bool _fixedAppBar = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = ScrollController();
  //   _controller.addListener(() {
  //     setState(() {
  //       _fixedAppBar = _controller.position.pixels > 130;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  final Map _detail = const {
    "rowkey": "7696739736057646784",
    "bookId": "1526632300797129023",
    "bookName": "逆天萌宝妖孽娘亲",
    "bookAuthorName": "纳兰凤瑾",
    "bookPic": "http://images01.mopimg.cn/imgs/20180518/20180518_92c50f883504c8d9ef585895492cdb4d.JPEG",
    "bookType": "言情女",
    "bookTypeId": "1015",
    "bookStatus": "1",
    "auditStatus": "1",
    "isgrounding": "1",
    "desc": "墨家的妖孽家主被信任的人害死之后，穿越重生为被发配边疆的七月郡主，生下了天赋逆天的天才儿子。从此，驭万兽，建城池，炼神丹，修炼逆天秘籍，傲视天下，神挡杀神，佛挡灭佛。当他强大冷酷的说儿子是他的，当邪魅霸道的他说这儿子他要了，当……可爱萌宝站了出来，说道：“想要当我爹爹，必须……”推荐一本完结宝文《天才baby》",
    "lastRecordHtml": "180518163143902260298.html",
    "lastRecordChapter": "7696739732952515509",
    "lastRecordTitle": "第1章 天才陨落",
    "bookWords": "1567794",
    "updateTime": "2018-05-18 10:42",
    "userCounts": 18334,
    "authordesc": "",
    "bookHtml": "180518163140797129023.html",
    "totalChapters": "520",
    "latestChapterTitle": "第520章 大结局",
    "latestChapterRow": "1526632350626604835",
    "replynum": 44,
    "tag": "古言,妖孽,重生,宝宝,女尊,女强,",
    "readFlag": false,
    "buyFlag": false
  }; 
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _detail['bookName'],
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            tooltip: '分享',
            icon: Icon(IconData(0xe739, fontFamily: 'iconfont')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BookDetailHeader(detail: _detail),
            BookDetailInfo(detail: _detail),
            BookDetailLinks(detail: _detail),
            BookDetailRelevant()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              child: FlatButton(
                onPressed: (){},
                child: Column(
                  children: <Widget>[
                    Icon(IconData(0xe65d, fontFamily: 'iconfont')),
                    Text('加入书架')
                  ],
                ),
              )
            ),
            Container(
              child: FlatButton(
                onPressed: (){},
                child: Column(
                  children: <Widget>[
                    Icon(IconData(0xe65d, fontFamily: 'iconfont')),
                    Text('加入书架')
                  ],
                ),
              )
            ),
            Container(
              child: FlatButton(
                onPressed: (){},
                child: Column(
                  children: <Widget>[
                    Icon(IconData(0xe65d, fontFamily: 'iconfont')),
                    Text('加入书架')
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}