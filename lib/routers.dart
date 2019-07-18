/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:13:38
 * @LastEditTime: 2019-07-18 17:25:53
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/pages/container.dart';
import 'package:app/pages/search/search_page.dart';
import 'package:app/pages/bookdetail/bookdetail_page.dart';
import 'package:app/pages/rank/rank_page.dart';
import 'package:app/pages/catalog/catalog_page.dart';
import 'package:app/pages/category/category_page.dart';
import 'package:app/pages/categorydetail/category_detail_page.dart';
import 'package:app/pages/webview/webview_page.dart';
import 'package:app/pages/error/notfound_page.dart';

/* demo-page */
import 'package:app/pages/demo/calendar/calendar_page.dart';
import 'package:app/pages/demo/chart/chart_page.dart';
import 'package:app/pages/demo/deviceinfo/deviceinfo_page.dart';
import 'package:app/pages/demo/imagepreview/imagepreview_page.dart';
import 'package:app/pages/demo/map/map_page.dart';
import 'package:app/pages/demo/permission/permission_page.dart';
import 'package:app/pages/demo/route/route_page.dart';
import 'package:app/pages/demo/scan/scan_page.dart';
import 'package:app/pages/demo/theme/theme_page.dart';
import 'package:app/pages/demo/video/video_page.dart';

/* demo-state-page */
import 'package:app/pages/demo/state/state_page.dart';
import 'package:app/pages/demo/state/bloc/bloc_page.dart';
import 'package:app/pages/demo/state/blocglobal/bloc_global_page.dart';
import 'package:app/pages/demo/state/eventbus/eventbus_page.dart';
import 'package:app/pages/demo/state/redux/redux_page.dart';
import 'package:app/pages/demo/state/rxdart/rxdart_page.dart';
import 'package:app/pages/demo/state/scoped_model/scoped_model_page.dart';

class Router {
  static const String searchPage = 'search';
  static const String bookdetailPage = 'bookdetail';
  static const String rankPage = 'rank';
  static const String catalogPage = 'catalog';
  static const String categoryPage = 'category';
  static const String categoryDetailPage = 'categoryDetail';
  static const String webviewPage = 'webview';

  /* demo-page */
  static const String calendarPage = 'calendar';
  static const String chartPage = 'chart';
  static const String deviceinfoPage = 'deviceinfo';
  static const String imagepreviewPage = 'imagepreview';
  static const String mapPage = 'map';
  static const String permissionPage = 'permission';
  static const String routePage = 'route';
  static const String scanPage = 'scan';
  static const String themePage = 'theme';
  static const String videoPage = 'video';

  /* demo-state-page */
  static const String statePage = 'state';
  static const String scopedmodelPage = 'scopedmodel';
  static const String reduxPage = 'redux';
  static const String blocPage = 'bloc';
  static const String blocglobalPage = 'blocglobal';
  static const String rxdartPage = 'rxdart';
  static const String eventbusPage = 'eventbus';


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
      
      /* demo-page */
      case calendarPage:
        return CalendarPage();
      case chartPage:
        return ChartPage();
      case deviceinfoPage:
        return DeviceInfoPage();
      case imagepreviewPage:
        return ImagePreviewPage();
      case mapPage:
        return MapPage();
      case permissionPage:
        return PermissionPage();
      case routePage:
        return RoutePage();
      case scanPage:
        return ScanPage();
      case themePage:
        return ThemePage();
      case videoPage:
        return VideoPage();
      
      /* demo-state-page */
      case statePage:
        return StatePage();
      case blocPage:
        return BlocPage();
      case blocglobalPage:
        return BlocGlobalPage();
      case eventbusPage:
        return EventBusPage();
      case reduxPage:
        return ReduxPage();
      case rxdartPage:
        return RxDartPage();
      case scopedmodelPage:
        return ScopedModelPage();
      
      default:
        return NotFoundPage();
    }
  }

  static push(BuildContext context, String name, [Map params]) {
    Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context){
      return _buildPage(name, params);
    }),);
  }
  
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static root(BuildContext context, [int index = 0]) {
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context){
      return ContainerPage(currentIndex: index,);
    }), (route) => route == null);
  }
}