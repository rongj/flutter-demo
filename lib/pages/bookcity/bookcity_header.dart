/*
 * @Author: Rongj
 * @Date: 2019-06-26 10:42:07
 * @LastEditTime: 2019-06-26 16:40:38
 */

import 'package:flutter/material.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/components/carousel_banner.dart';

class BookCityHeader extends StatefulWidget {
  const BookCityHeader({
    Key key,
    this.fixed,
  }): super(key: key);
  final bool fixed;

  @override
  _BookCityHeaderState createState() => _BookCityHeaderState();
}

class _BookCityHeaderState extends State<BookCityHeader> {
  // 导航
  List<String> _tabNavs = [ '推荐', '男生', '女生', '免费']; 

  Widget _buildTabNavs(
    BuildContext context,
    List<String> items,
  ) {
    // final double _fullWidth = MediaQuery.of(context).size.width;
    final double _navTitleSize = 18.0;
    final double _navTitleMargin = 15.0;
    final double _activeLineWidth = 20.0;
    // int _activeIndex = _tabNavs.length
    // double _activeLineLeft = _fullWidth/2 - 22 - _activeLineWidth/2 - _navTitleMargin - ((_navTitleSize + _navTitleMargin) * 2 * 0) ;
    Color _tabNavDefaultColor = widget.fixed ? null : Colors.white;
    // int _activeIndex = 0;
    Color _tabNavActiveColor = widget.fixed ? Theme.of(context).primaryColor : Colors.white;
    
    TextStyle _navDefalutStyle = TextStyle(
      color: _tabNavDefaultColor,
      fontSize: _navTitleSize,
      fontWeight: FontWeight.normal
    );

    return Container(
      alignment: Alignment.center,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((f) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: _navTitleMargin),
                child: Text(f, style: _navDefalutStyle),
              );
            }).toList(),
          ),
          Positioned(
            left: 92.0,
            top: 28.0,
            child: Container(
              width: _activeLineWidth,
              height: 2.0,
              color: widget.fixed ? _tabNavActiveColor : _tabNavDefaultColor,
            ),
          )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double _bannerHeight = MediaQuery.of(context).size.width / 16 * 8;
    return SliverAppBar(
      pinned: true,
      expandedHeight: _bannerHeight - 25,
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselBanner(
          bannerHeight: _bannerHeight
        )
      ),
      title: _buildTabNavs(context, _tabNavs),
      centerTitle: true,
      backgroundColor: widget.fixed ? Colors.white : Colors.transparent,
      actionsIconTheme: widget.fixed ? null : IconThemeData(color: Colors.white),
      elevation: 0.3,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return SearchPage();
            }));
          }
        ),
      ],
    );
  }
}
