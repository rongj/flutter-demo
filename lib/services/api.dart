/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:52:49
 * @LastEditTime: 2019-07-08 15:27:28
 */

import '../utils/http_request.dart';

class Api {
  // 一周最热
  static getWeekList() => HttpRequest.get('book/newboard/bzph.json');

  // 猜你喜欢
  static getGuessList() => HttpRequest.get('book/banner/pc_banner.json');

  // 精品汇聚
  static getQualityList() => HttpRequest.get('book/newboard/nvsrs.json');

  // 热门推荐
  static getHotList() => HttpRequest.get('book/newboard/nansrs.json');

  // 搜索推荐
  static getSearchList() => HttpRequest.get('book/search/search.json');

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

  // 详情
  static getBookDetail(data) => HttpRequest.post('http://novelapi.mop.com/book/v1/getDetail', data);

  // 目录
  static getBookCatalog(data) => HttpRequest.post('http://novelapi.mop.com/book/chapter/v1/list', data);
}