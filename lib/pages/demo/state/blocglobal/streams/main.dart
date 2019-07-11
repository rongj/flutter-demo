/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:04:48
 * @LastEditTime: 2019-07-11 20:05:16
 */

import 'dart:async';

class CountBLoC {
  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;
  int get value => _count;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

CountBLoC bLoC = CountBLoC();