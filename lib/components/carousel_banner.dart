/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:42:44
 * @LastEditTime: 2019-06-26 17:37:52
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({
    Key key,
    this.bannerHeight,
  }): super(key: key);
  final double bannerHeight;

  @override
  _CarouselBannerState createState() => _CarouselBannerState();
}


class _CarouselBannerState extends State<CarouselBanner> {

  void _onSwiperItemTap(int index) {
    print('点击了第$index个');
  }

  List<Map> _bannerItems = [
    {
      'img': 'http://hbimg.b0.upaiyun.com/80ad81799e6a98aaa9bcf75faf787279beb42ba0b37d-st3oB2_fw658',
      'title': 'ces1',
    },
    {
      'img': 'http://img.zcool.cn/community/013d5558c128eba801219c779345c0.jpg',
      'title': 'ces3',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _bannerItems[index]['img'],
            height: widget.bannerHeight,
            fit: BoxFit.fill,
          );
        },
        itemCount: _bannerItems.length,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(8.0),
          builder: DotSwiperPaginationBuilder(
            size: 5.0,
            activeSize: 5.0,
            space: 2.0
          )
        ),
        onTap: _onSwiperItemTap,
      ),
    );
  }
}
