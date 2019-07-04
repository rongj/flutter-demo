/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:42:44
 * @LastEditTime: 2019-07-04 09:28:32
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyAd extends StatelessWidget {

  void _onSwiperItemTap(int index) {
    print('点击了第$index个');
  }

  List<Map> _bannerItems = [
    {
      'img': 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562760231&di=22feeaa902fa93d036e04a3c3b18521b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0190ae5541b824000001e78c19935c.jpg',
      'title': 'ces1',
    },
    {
      'img': 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3313200692,2815548471&fm=26&gp=0.jpg',
      'title': 'ces3',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: NetworkImage(_bannerItems[index]['img']),
                fit: BoxFit.fill,
              )
            ),
          );
        },
        itemCount: _bannerItems.length,
        onTap: _onSwiperItemTap,
      ),
    );
  }
}
