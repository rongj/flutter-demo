/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:52:49
 * @LastEditTime: 2019-07-05 18:29:24
 */

import 'package:dio/dio.dart';
import 'dart:convert' show json;

class HttpRequest {
  // 或者通过传递一个 `BaseOptions`来创建dio实例
  static BaseOptions options = BaseOptions(
    baseUrl: "http://dc.mop.com/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio dio = Dio(options);

  static Future get(String uri, [Map data]) async {
    Response res = await dio.get(uri);
    return res.data;
  }
}

