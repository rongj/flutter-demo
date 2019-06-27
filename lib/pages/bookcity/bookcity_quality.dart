/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-06-27 17:01:02
 */

import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/components/novel_item_column.dart';

class BookCityQuality extends StatefulWidget {
  @override
  _BookCityQualityState createState() => _BookCityQualityState();
}

class _BookCityQualityState extends State<BookCityQuality> {

  final List<Map> _novelData = const [
    {
      "bookname": "世界以痛吻我",
      "author": "玛丽那个苏",
      "img": "http://images01.mopimg.cn/imgs/20180906/20180906_2594ee9ce76e00c665a872af6942b234_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180906174921568493700.html",
      "bookid": "1536227361568493700"
    },
    {
      "bookname": "帝少追缉令，天才萌宝亿万妻",
      "author": "猫小咪",
      "img": "http://images01.mopimg.cn/imgs/20180308/20180308_331c99db357fddff24f446b6b6b9fbeb_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308175057001987449.html",
      "bookid": "1520502657001987449"
    },
    {
      "bookname": "桃野小农民",
      "author": "东北逍遥王",
      "img": "http://images01.mopimg.cn/imgs/20180626/20180626_e4016ddebb9056870506560329d50cd1_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180626173611877375581.html",
      "bookid": "1530005771877375581"
    },
    {
      "bookname": "都市之最强狂兵",
      "author": "大红大紫",
      "img": "http://images01.mopimg.cn/imgs/20180502/20180502_a8f67686a7ccce62d87ab9476255cd8f_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180502025620850812832.html",
      "bookid": "1525200980850812832"
    },
    {
      "bookname": "爱你是场逃不过的劫",
      "author": "悦凝兮",
      "img": "http://images01.mopimg.cn/imgs/20180615/20180615_62f3ac4ac7a40fc431013ada9d43d389_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180615113210688536116.html",
      "bookid": "1529033530688536116"
    },
    {
      "bookname": "嫡女贵凰：重生毒妃狠绝色",
      "author": "路菲汐",
      "img": "http://images01.mopimg.cn/imgs/20180907/20180907_d231477e4218f2f4a55b2becfd2e0b33_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180907111511593395802.html",
      "bookid": "1536290111593395802"
    },
    {
      "bookname": "傅少的秘宠娇妻",
      "author": "迟禾池鱼",
      "img": "http://images01.mopimg.cn/imgs/20171208/20171208_5b0629e68c87150998b199be336692b9_3_4_200.jpg",
      "url": "http://wx.mop.com/book/171123163611843722671.html",
      "bookid": "1511426171843722671"
    },
    {
      "bookname": "医妃驾到：王爷莫嚣张",
      "author": "流年",
      "img": "http://images01.mopimg.cn/imgs/20180308/20180308_ead39978b4c942713e712546673f27e7_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308174439708106142.html",
      "bookid": "1520502279708106142"
    },
    {
      "bookname": "我曾用心爱过你",
      "author": "棠溪",
      "img": "http://images01.mopimg.cn/imgs/20180615/20180615_48aa025fc0f1f95748f5012634a309de_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180615113359141518965.html",
      "bookid": "1529033639141518965"
    },
    {
      "bookname": "九阳天尊",
      "author": "冰魂",
      "img": "http://images01.mopimg.cn/imgs/20180908/20180908_cba83311403553830ad9618e3bc73cd0_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180908071944561186889.html",
      "bookid": "1536362384561186889"
    },
    {
      "bookname": "天庭微博红包群",
      "author": "布凡",
      "img": "http://images01.mopimg.cn/imgs/20181027/20181027_df3834d2766738c3f0ad081702244987_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181027123844559796814.html",
      "bookid": "1540615124559796814"
    },
    {
      "bookname": "暴力俏村姑",
      "author": "风轻灵",
      "img": "http://images01.mopimg.cn/imgs/20181025/20181025_e58cc6cb66f3475d56bc9ba41bb3b361_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181025060831710292340.html",
      "bookid": "1540418911710292340"
    },
    {
      "bookname": "田园锦绣：农家小厨娘",
      "author": "烟月",
      "img": "http://images01.mopimg.cn/imgs/20181025/20181025_38f31fa5151900988e828181a15f3397_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181025115426188669247.html",
      "bookid": "1540439666188669247"
    },
    {
      "bookname": "胜邪天下，绝世质子妃",
      "author": "拂风旖旎",
      "img": "http://images01.mopimg.cn/imgs/20180710/20180710_d188bc93e4bcb342e9b7be86ac579b32_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180710165330067354904.html",
      "bookid": "1531212810067354904"
    },
    {
      "bookname": "最强仙尊重生都市",
      "author": "非言",
      "img": "http://images01.mopimg.cn/imgs/20181018/20181018_c42a89885f7f63d34959fc3433902f2f_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181018064753015671232.html",
      "bookid": "1539816473015671232"
    },
    {
      "bookname": "邪帝狂后：废材九小姐",
      "author": "醉卧天下",
      "img": "http://images01.mopimg.cn/imgs/20180907/20180907_df17ccc817ccb789ac120446f7dbb415_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180907003501140536243.html",
      "bookid": "1536251701140536243"
    },
    {
      "bookname": "法医狂妃",
      "author": "谁家mm",
      "img": "http://images01.mopimg.cn/imgs/20181027/20181027_6a449c2a8aa7ac3eba3328ef3ec2bfa5_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181027135412762131928.html",
      "bookid": "1540619652762131928"
    },
    {
      "bookname": "夺嫡",
      "author": "南华",
      "img": "http://images01.mopimg.cn/imgs/20180903/20180903_39096d27bd471426f88dd8731de290be_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180903193543083223043.html",
      "bookid": "1535974543083223043"
    }
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onChangeTap() {
    setState(() {
      _currentIndex = _currentIndex < 2 ? _currentIndex + 1 : 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '精品汇聚',
      toolBar: Container(
        child: GestureDetector(
          onTap: _onChangeTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.refresh,
                size: 18.0,
                color: Colors.black54,
              ),
              Text(
                '换一换',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  height: 0.9,
                ),
              )
            ],
          ),
        )
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 15.0,
          children: List<Widget>.generate(6, (index) {
            return NovelItemColumn(
              title: _novelData[index + _currentIndex*6]['bookname'],
              img: _novelData[index + _currentIndex*6]['img'],
              subtitle: _novelData[index + _currentIndex*6]['author'],
            );
          }),
        ),
      )
    );
  }
}