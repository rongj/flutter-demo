/*
 * @Author: Rongj
 * @Date: 2019-07-18 10:13:13
 * @LastEditTime: 2019-07-18 17:33:57
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SplashGuide extends StatelessWidget {
  SplashGuide({
    Key key,
    this.show,
    this.onEnteryTap
  }): super(key: key);
  
  final bool show;
  final Function onEnteryTap;

  final List<Map<String, String>> _guideList = const [
    {
      'title': '精选书库',
      'subtitle': '精品小说，为你一网打尽',
      'img': 'assets/images/guide1.jpg',
    },
    {
      'title': '新人福利',
      'subtitle': '注册即送600书币，精彩小说读不停',
      'img': 'assets/images/guide3.jpg',
    },
    {
      'title': '分享福利',
      'subtitle': '分享APP给好友，更多书币等你拿',
      'img': 'assets/images/guide6.jpg',
    },
    {
      'title': '享受阅读',
      'subtitle': '读小说，专属好礼送不停',
      'img': 'assets/images/guide8.jpg',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !show,
      child: Swiper(
        itemCount: _guideList.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, String> _item = _guideList[index];
          return Stack(
            children: <Widget>[
              Image.asset(
                _item['img'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_item['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),
                    ),
                    Text(_item['subtitle'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
              index == _guideList.length - 1 ?
              Positioned(
                bottom: 120.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: onEnteryTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 1)
                      ),
                      child: Text('立即体验', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24.0),),
                    ),
                  ),
                ),
              ) : null
            ].where((Object o) => o != null).toList(),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 30.0),
          builder: DotSwiperPaginationBuilder(
            size: 10.0,
            activeSize: 10.0,
            space: 5.0
          )
        ),
        loop: false,
      ),
    );
  }
}