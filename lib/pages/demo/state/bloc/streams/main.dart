/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:04:48
 * @LastEditTime: 2019-07-11 18:09:28
 */

import 'dart:async';

class CountBLoC {
  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;
  int get value => _count;

  void increment() => _countController.sink.add(++_count);

  void dispose() => _countController.close();
}