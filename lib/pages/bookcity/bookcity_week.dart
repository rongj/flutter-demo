/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-06-26 17:47:03
 */

import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class BookCityWeek extends StatelessWidget {
  void _onSwiperItemTap(int index) {
    print('点击了第$index个');
  }

  final List<Map> _novelData = const [
    {
      "bookname": "王者荣耀",
      "author": "貂蝉",
      "img": "http://images01.mopimg.cn/imgs/20171208/20171208_18090e4e7c315d370be336ac3473b455_3_4_200.jpg",
      "url": "http://wx.mop.com/book/171127164652138830163.html",
      "bookid": "1511772412138830163"
    },
    {
      "bookname": "逆天萌宝妖孽娘亲",
      "author": "纳兰凤瑾",
      "img": "http://images01.mopimg.cn/imgs/20180518/20180518_92c50f883504c8d9ef585895492cdb4d_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180518163140797129023.html",
      "bookid": "1526632300797129023"
    },
    {
      "bookname": "极品村医",
      "author": "大地恩情",
      "img": "http://images01.mopimg.cn/imgs/20180308/20180308_a82ce04707d1d8f9db739e3b14cf04c7_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308184900178144957.html",
      "bookid": "1520506140178144957"
    },
    {
      "bookname": "闪婚甜妻：高冷老公晚上约",
      "author": "筱筱风",
      "img": "http://images01.mopimg.cn/imgs/20190107/20190107_699eabb5bb125b65ba5955f46e043ead_3_4_200.jpg",
      "url": "http://wx.mop.com/book/190107151342741241457.html",
      "bookid": "1546845222741241457"
    },
    {
      "bookname": "都市最强战医",
      "author": "人生几渡",
      "img": "http://images01.mopimg.cn/imgs/20180208/20180208_5cf9f250aa3b07cf981862f896c431db_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180208180528906528677.html",
      "bookid": "1518084328906528677"
    },
    {
      "bookname": "皇后万万岁",
      "author": "浮生如梦",
      "img": "http://images01.mopimg.cn/imgs/20180529/20180529_66d09d51b62c01e368bbd73bb7860d80_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180529125210554934259.html",
      "bookid": "1527569530554934259"
    },
    {
      "bookname": "蚀心总裁：爱有千千劫",
      "author": "琴公子",
      "img": "http://images01.mopimg.cn/imgs/20180308/20180308_225b73c5282fb0781610ed1145544145_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308174010259402931.html",
      "bookid": "1520502010259402931"
    },
    {
      "bookname": "九焰至尊",
      "author": "爱吃白菜",
      "img": "http://images01.mopimg.cn/imgs/20180208/20180208_d7e43b3280e2cf232e7f56485d904d98_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180208165322106579835.html",
      "bookid": "1518080002106579835"
    },
    {
      "bookname": "女总裁的顶级高手",
      "author": "天下",
      "img": "http://images01.mopimg.cn/imgs/20180529/20180529_f91debdc06e5fb44baf67ab722f86156_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180529142058392439392.html",
      "bookid": "1527574858392439392"
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '一周最热',
      toolBar: Container(
        child: Row(
          children: List.generate(3, (index) {
            return Container(
              width: 10.0,
              height: index == 1 ? 3.0 : 1.0,
              margin: EdgeInsets.only(left: 5.0),
              color: index == 1 ? Theme.of(context).primaryColor : Colors.black12,
            );
          }),
        ),
      ),
      body: Container(     
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            // return Image.network(
            //   _bannerItems[index]['img'],
            //   height: widget.bannerHeight,
            //   fit: BoxFit.fill,
            // );
          },
          itemCount: _novelData.length % 3,
          // pagination: SwiperPagination(
          //   alignment: Alignment.bottomRight,
          //   margin: EdgeInsets.all(8.0),
          //   builder: DotSwiperPaginationBuilder(
          //     size: 5.0,
          //     activeSize: 5.0,
          //     space: 2.0
          //   )
          // ),
          onTap: _onSwiperItemTap,
        ),
      )
    );
  }
}