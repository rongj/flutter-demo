/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:52:49
 * @LastEditTime: 2019-07-05 18:29:29
 */

import '../utils/http_request.dart';

class Api {
  // 热门榜单
  static getRankHotList() => HttpRequest.get('book/newrank/hot.json');

  // 全本榜单
  static getRankFullList() => HttpRequest.get('book/newrank/full.json');

  // 新书榜单
  static getRankNewList() => HttpRequest.get('book/newrank/new.json');

  // 畅销榜单
  static getRankSellList() => HttpRequest.get('book/newrank/sell.json');

  // 收藏排行
  static getRankCollectList() => HttpRequest.get('http://novelapi.mop.com/book/v1/topCollect');

  // 点击排行
  static getRankClickList() => HttpRequest.get('http://novelapi.mop.com/book/v2/categoryList');
}