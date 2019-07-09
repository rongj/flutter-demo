/*
 * @Author: Rongj
 * @Date: 2019-07-05 15:52:49
 * @LastEditTime: 2019-07-09 13:47:11
 */

import 'dart:io';
import 'package:dio/dio.dart';

class HttpRequest {
  // 或者通过传递一个 `BaseOptions`来创建dio实例
  static BaseOptions options = BaseOptions(
    baseUrl: "http://dc.mop.com/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: ContentType.parse("application/x-www-form-urlencoded")
  );

  static Dio dio = Dio(options);

  static Future get(String uri, [Map data]) async {
    Response res = await dio.get(uri, queryParameters: data);
    return res.data;
  }

  static Future post(String uri, [Map data]) async {
    Response res = await dio.post(uri, data: data);
    return res.data;
  }
}

