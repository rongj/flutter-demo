/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:13:38
 * @LastEditTime: 2019-07-17 09:52:56
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
  static const searchPage = 'search';
  static const bookdetailPage = 'bookdetail';
  static const rankPage = 'rank';
  static const catalogPage = 'catalog';
  static const categoryPage = 'category';
  static const categoryDetailPage = 'categoryDetail';
  static const webviewPage = 'webview';

  /* demo-page */
  static const calendarPage = 'calendar';
  static const chartPage = 'chart';
  static const deviceinfoPage = 'deviceinfo';
  static const imagepreviewPage = 'imagepreview';
  static const mapPage = 'map';
  static const permissionPage = 'permission';
  static const routePage = 'route';
  static const scanPage = 'scan';
  static const themePage = 'theme';
  static const videoPage = 'video';

  /* demo-state-page */
  static const statePage = 'state';
  static const scopedmodelPage = 'scopedmodel';
  static const reduxPage = 'redux';
  static const blocPage = 'bloc';
  static const blocglobalPage = 'blocglobal';
  static const rxdartPage = 'rxdart';
  static const eventbusPage = 'eventbus';


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

  static root(BuildContext context, int index) {
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context){
      return ContainerPage(currentIndex: index,);
    }), (route) => route == null);
  }
}