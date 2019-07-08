/*
 * @Author: Rongj
 * @Date: 2019-07-05 16:08:46
 * @LastEditTime: 2019-07-08 11:04:09
 */

import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class MockData {
  static Future getBookshelfList() {
    return Future.delayed(Duration(milliseconds: 500), () async{
      String res = await rootBundle.loadString('mock/bookshelf.json');
      List data = json.decode(res);
      return data;
    });
  }

  static Future getBookweekList() {
    return Future.delayed(Duration(milliseconds: 200), () async{
      String res = await rootBundle.loadString('mock/bookweek.json');
      List data = json.decode(res);
      return data;
    });
  }
  
}