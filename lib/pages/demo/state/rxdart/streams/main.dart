/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:04:48
 * @LastEditTime: 2019-07-11 18:08:41
 */

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CountBLoC {
  int _count = 0;
  var _subject = BehaviorSubject<int>();

  Stream<int> get stream => _subject.stream;
  int get value => _count;

  void increment() => _subject.add(++_count);

  void  dispose() => _subject.close();
}