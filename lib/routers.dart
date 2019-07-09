/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:13:38
 * @LastEditTime: 2019-07-09 17:47:54
 */

import 'package:flutter/material.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/pages/bookdetail/bookdetail_page.dart';
import 'package:app/pages/rank/rank_page.dart';
import 'package:app/pages/catalog/catalog_page.dart';
import 'package:app/pages/category/category_page.dart';
import 'package:app/pages/categorydetail/category_detail_page.dart';
import 'package:app/pages/webview/webview_page.dart';
import 'package:app/pages/error/notfound_page.dart';

class Router {
  static const searchPage = 'search';
  static const bookdetailPage = 'bookdetail';
  static const rankPage = 'rank';
  static const catalogPage = 'catalog';
  static const categoryPage = 'category';
  static const categoryDetailPage = 'categoryDetail';
  static const webviewPage = 'webview';

  static Widget _buildPage(String name, Map params) {
    switch(name) {
      case searchPage:
        return SearchPage();
      case bookdetailPage:
        return BookDetailPage(bookId: params['bookId']);
      case rankPage:
        return RankPage();
      case catalogPage:
        return CatalogPage(bookId: params['bookId']);
      case categoryPage:
        return CategoryPage();
      case categoryDetailPage:
        return CategoryDetailPage(title: params['title'], gender: params['gender'], type: params['type'],);
      case webviewPage:
        return WebviewPage(title: params['title'], url: params['url'],); 
      default:
        return NotFoundPage();
    }
  }

  static push(BuildContext context, String name, [Map params]) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return _buildPage(name, params);
    }));
  }
  
  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}