/*
 * @Author: Rongj
 * @Date: 2019-06-26 11:02:31
 * @LastEditTime: 2019-06-27 14:56:24
 */

import 'package:flutter/material.dart';
import 'package:app/components/plate_layout.dart';
import 'package:app/components/novel_item_row.dart';

class BookCityHot extends StatelessWidget {
  final List<Map> _novelData = const [
    {
      "bookname": "来不及再轰轰烈烈",
      "author": "苏软",
      "img": "http://images01.mopimg.cn/imgs/20181121/20181121_229361bc8659f0f77c5571a23024aaf9_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181121170555418391011.html",
      "bookid": "1542791155418391011",
      "desc": "未婚夫出轨，她酩酊大醉，却被一个神秘的男人捡走了。捡走了不要紧，失态失身又失心是怎么回事？那个男人几次三番地救她水火之中，让她灰暗的人生有了别样的光彩。她逐渐深陷，动了真心，再次踏入婚姻殿堂。可天堂与地狱只在一念之间，为什么曾经帮她念她拿命给她的男人，最后却想要她的命？",
      "tag": "现代言情",
      "status": "1"
    },
    {
      "bookname": "服务员，来个总裁打包带走",
      "author": "优雅的毛毛虫",
      "img": "http://images01.mopimg.cn/imgs/20180705/20180705_6dcd7d57fec976daa3af4b56c9a0a45c_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180705183237173907429.html",
      "bookid": "1530786757173907429",
      "desc": "沐靖颜，浅浅一笑，酒窝在脸颊若隐若现，可爱如天仙。 校园里，远远的一眼，她便爱他入骨，等他七年，无怨无悔。七年之后，如愿成了他的妻子，每天和婆婆小姑斗智斗勇，没成想，他的青梅竹马竟然回来了！为了捍卫自己的地位，“老公，我要跟你生个孩子。” 黎晟睿，长而微卷的睫毛下，幽暗深邃的冰眸子，邪魅性感。 七年之后，他认定她是此生唯一的女人，发誓要一生护她，宠她。当年的意外，他对她有所隐瞒，只好瞒着她，告诉她他不想要孩子，为妻子怒对十年的青梅竹马，“我跟你十年前发生过什么吗？” 遇见你，余生都是你。",
      "tag": "总裁,霸道,言情,娇妻",
      "status": "1"
    },
    {
      "bookname": "女总裁的最强兵王",
      "author": "民王",
      "img": "http://images01.mopimg.cn/imgs/20180502/20180502_6a6544eefcab7e1b48a6ded050ad9101_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180502022406410164872.html",
      "bookid": "1525199046410164872",
      "desc": "五年前，江城第一大少古缜被逼离开家乡，家族分崩离析。五年后，化身最强兵王强势归来！这一次，欠我的百倍奉还！伤我亲人者，血债，血偿！长刀所指，谁愿与我，共战天下！",
      "tag": "热血,特种兵,强者回归",
      "status": "0"
    },
    {
      "bookname": "特种战卫",
      "author": "冷海隐士",
      "img": "http://images01.mopimg.cn/imgs/20180409/20180409_846f119ea09ae992535ac8ea762a136c_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308195750780830412.html",
      "bookid": "1520510270780830412",
      "desc": "一名中南海特卫的人生传奇。 他本来是一名放荡不羁学业无成的浪荡少年，天老大他老二。打架和泡妞是他的主业，但突然有一天，晴天一声霹雳响，他竟然被莫名其妙地特招进入了传说中的中央特卫局（化名），从此开始了他传奇般的人生。",
      "tag": "都市",
      "status": "1"
    },
    {
      "bookname": "宋小宇的妖孽人生",
      "author": "简单",
      "img": "http://images01.mopimg.cn/imgs/20181121/20181121_1325f8c6f1c68b7f2482f6a8fd4c2e84_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181121171421602812222.html",
      "bookid": "1542791661602812222",
      "desc": "纨绔公子，游走都市，且看他如何俘获美女，演绎自己的妖孽人生······",
      "tag": "现代都市",
      "status": "0"
    },
    {
      "bookname": "万古邪皇",
      "author": "司徒邀月",
      "img": "http://images01.mopimg.cn/imgs/20181121/20181121_47d7b647aff9b8768dde74f0293c955b_3_4_200.jpg",
      "url": "http://wx.mop.com/book/181121174052865462511.html",
      "bookid": "1542793252865462511",
      "desc": "加入邪派合欢宗，修炼双修秘法，穆强一步步成为万古邪皇，坐拥万千美女，统帅群仙争霸。",
      "tag": "爽文,美女,争霸,修炼,无敌,位面,",
      "status": "0"
    },
    {
      "bookname": "绝品仙医",
      "author": "妖孽书生",
      "img": "http://images01.mopimg.cn/imgs/20180308/20180308_fd62db345793c2dc18265218ee051455_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308181309903994131.html",
      "bookid": "1520503989903994131",
      "desc": "九品医师被害，却没想到重生在500年前的华夏。 他选择从零开始，势要复仇。 五百年后能做的事情，五百年前也能做，而且他做得更加疯狂，更加血性，他不想再次留下遗憾……",
      "tag": "都市",
      "status": "1"
    },
    {
      "bookname": "风情女上司",
      "author": "坐而不忘",
      "img": "http://images01.mopimg.cn/imgs/20180409/20180409_161402f3322b05e1aef01da107606fa6_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180308195904185581452.html",
      "bookid": "1520510344185581452",
      "desc": "刚上班就碰上了风情万种的美女上司，女上司冰冷娇媚，一向生人勿近，直到有一天，她喝醉了酒...",
      "tag": "都市",
      "status": "1"
    },
    {
      "bookname": "龙武九天",
      "author": "绿柠茶",
      "img": "http://images01.mopimg.cn/imgs/20180706/20180706_d5f0907e6960f029f970bc8dce3b299b_3_4_200.jpg",
      "url": "http://wx.mop.com/book/180706180104363585663.html",
      "bookid": "1530871264363585663",
      "desc": "龙族弃子丢落人界，这个大陆叫做武神大陆，人人皆可修武，看我叶啸云如何成为一代武神！站在人界巅峰！",
      "tag": "玄幻,热血,爽文,扮猪,装逼,升级,",
      "status": "0"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return PlateLayout(
      title: '热门小说',
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          children: List<Widget>.generate(_novelData.length, (index) {
            return NovelItemRow(
              img: _novelData[index]['img'],
              title: _novelData[index]['bookname'],
              desc: _novelData[index]['desc'],
              author: _novelData[index]['author'],
              tag: _novelData[index]['tag'],
              status: _novelData[index]['status'],
            );
          }),
        ),
      )
    );
  }
}